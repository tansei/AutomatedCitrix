<#
.SYNOPSIS
Script to setup Active  Directory

.DESCRIPTION
    This script is intended to set up a functioning AD forest with 1x root domain controller and one or more additional domain controllers

    The script uses - for now - a  self-signed cert to encryot the password, the thumbprint of this should be supplied on the machine.


.NOTES
    (Use the `Create-SelfSignedCert` function in the module to generate a cert if this is needed)
.LINK
    https://codeandkeep.com/Dsc-Install-AD-Forest/
    https://codeandkeep.com/Dsc-Encrypting-Credentials/
    https://github.com/dsccommunity/ActiveDirectoryDsc/wiki/ADDomain
    https://github.com/dsccommunity/ActiveDirectoryDsc/wiki/WaitForADDomain
    https://github.com/dsccommunity/ActiveDirectoryDsc/wiki/ADOrganizationalUnit
    https://github.com/dsccommunity/NetworkingDsc
    https://github.com/dsccommunity/NetworkingDsc/wiki
    https://github.com/dsccommunity/NetworkingDsc/wiki/IPAddress
    https://github.com/dsccommunity/NetworkingDsc/wiki/DnsServerAddress
.EXAMPLE

        # if (-not $cred){
        #     $cred = (Get-Credential -Message "Enter new domain's credential")
        # }


        # # install domain - using existing cert
        # & "\\tsclient\C\PROJECTS\dsc\SS.INFRA.DSC\NewAD\New-ADDSC.ps1"`
        # -domainCred $cred `
        # -certThumbprint "67A454BF08E151ACB012108D2EC4094258A4F494"

#>


[CmdletBinding()]
param (
    # Store the current directory path
    [Parameter(Mandatory = $false)] [string]
    $CurrentPath = (Split-Path -Parent $PSCommandPath)
    ,
    # Required modules
    [Parameter(Mandatory = $false)]
    $modules = @{
        'ActiveDirectoryDsc'    = '6.4.0'
        'NetworkingDsc'         = '9.0.0'
        'ComputerManagementDsc' = '9.1.0'
    }
    ,
    # If module installation is also needed
    [Parameter(Mandatory = $false)] [switch]
    $preReq
    ,
    # DSC encryption certificate
    [Parameter(Mandatory )] [string]
    $certThumbprint
    ,
    # Domain admin credential (the local admin credential will be set to this one!)
    #! user user@domain.com for the user
    [Parameter(Mandatory = $false)] [pscredential]
    $domainCred
    ,
    # The certificate file generated by 'Create-SelfSignedCert'
    [Parameter(Mandatory = $false)] [string]
    $certFilePath = 'C:\dsc\cert\DscPubKey.cer'
)

BEGIN
{
    #^ load functions
    Get-ChildItem $CurrentPath '*.psm1' | ForEach-Object { Import-Module $_.FullName -Force -WarningAction SilentlyContinue }

    if ($preReq.IsPresent)
    {
        #^ Install modules
        Install-Modules -modules $modules
    }

    $thisComputer = $env:COMPUTERNAME

}

PROCESS
{

    # Self signed certificate in the local computer certificate store
    $cert = Get-Item -Path "Cert:\LocalMachine\My\$certThumbprint"

    #^ The certificate has been exported to this path



    #^ Customize this with your details #TODO: move this to a data file
    $config = @{
        AllNodes = @(
            @{
                NodeName          = '*'
                DomainName        = 'lab.local' #FIXME: your domain FQDN
                DomainNetbiosName = 'lab' #FIXME: your domain NetBIOS
                Thumbprint        = $cert.Thumbprint
                CertificateFile   = $certFilePath
                NTDSPath          = 'C:\Windows\NTDS'
                LogPath           = 'C:\Windows\Logs'
                SysvolPath        = 'C:\Windows\SYSVOL'
                TimeZone          = 'Central European Standard Time' #https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-time-zones?view=windows-11
                Locale            = 'pl-PL'                          #https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-input-locales-for-windows-language-packs?view=windows-11
            }
            @{
                NodeName                    = '10.2.134.201'
                ComputerName                = 'dc01'
                IPV4Address                 = '10.2.134.201/24'
                Role                        = 'RootDomainController'
                DNSServers                  = '127.0.0.1', '1.1.1.1' #NOTE: Cloudflare IP is optional
                # # domain settings -->
                ComplexityEnabled           = $false
                MinPasswordLength           = 8
                FirstSite                   = 'Lab-Site' #FIXME: your first site's name
                AdditionalSites             = @('Lab-SH', 'Lab-HQ', 'Lab-BR') #FIXME: additional sites
                SitelinkPrimaryMembers      = @('Lab-OY', 'Lab-SH', 'Lab-HQ') #FIXME: optional
                SitelinkSecondaryMembers    = @('Lab-SH', 'Lab-OY', 'Lab-BR') #FIXME: optional
                NTPServer                   = '0.pl.pool.ntp.org' #FIXME: prefered NTP server
                FailOverNTPServers          = ('1.pl.pool.ntp.org','2.pl.pool.ntp.org')  #FIXME: alternative NTP server
                #NTPServer                   = '10.13.36.4' #FIXME: prefered NTP server
                #FailOverNTPServers          = ('10.13.36.7','time.windows.com')  #FIXME: alternative NTP server
            }
            @{
                NodeName            = '10.2.134.202' #FIXME: additional DC
                ComputerName        = 'dc02' #FIXME: additional DC
                IPV4Address         = '10.2.134.202/24' #FIXME: additional DC IP
                Role                = 'MemberDomainController'
                DNSServers          = '10.2.134.201', '1.1.1.1' #FIXME: first DC + any optional DNS servers
                Site                = 'Lab-Site' #FIXME: any valid site created on the first DC
                IsGlobalCatalog     = $true
                NTPServer           = '0.pl.pool.ntp.org' #FIXME: prefered NTP server
                FailOverNTPServers  = ('3.pl.pool.ntp.org','time.windows.com') #FIXME: alternative NTP server
            }
        )
    }

    if ($thisComputer -match 'dc01')
    {
        #^ Generate configuration MOF files for the first DC
        DomainFirstDC -ConfigurationData $config `
            -OutputPath C:\dsc\AD `
            -DomainCredential $domainCred `
            -SafemodePassword $domainCred `
            -NetAdapterName 'Ethernet0'
    }
    else
    {
        #^ Generate configuration MOF files for the additional DCs
        DomainAdditionalDCs -ConfigurationData $config `
            -OutputPath C:\dsc\AD `
            -DomainCredential $domainCred `
            -SafemodePassword $domainCred `
            -NetAdapterName 'Ethernet0'
    }



    #^ Configure the LCM
    Set-DscLocalConfigurationManager -Path C:\dsc\AD -Force -Verbose

    #^ Apply the Dsc Configuration
    Start-DscConfiguration -Path C:\dsc\AD -Force -Wait -Verbose
}

END
{
    #^ Verify status of the configuration
    $state = (Test-DscConfiguration -Path C:\dsc\AD)
    Write-Host $($state.ResourcesNotInDesiredState | Format-Table -AutoSize -Wrap | Out-String) -ForegroundColor Red
    Write-Host $($state.ResourcesInDesiredState | Format-Table -AutoSize -Wrap | Out-String) -ForegroundColor Green
    Write-Warning 'Please review resources displayed in RED!'
}
