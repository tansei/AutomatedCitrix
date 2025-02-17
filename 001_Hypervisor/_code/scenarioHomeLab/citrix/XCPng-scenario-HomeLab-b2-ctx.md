## CTX SETUP

### CTX - VM Provisioning

#### Windows - Server OS - Broker

```bash
/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx01B' --VCpu 4 --CoresPerSocket 2 --MemoryGB 4 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:33' --StorageName 'node4_ssd_sdb' --VmDescription 'w2k22_Broker'

/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx02B' --VCpu 4 --CoresPerSocket 2 --MemoryGB 4 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:34' --StorageName 'node4_ssd_sdd' --VmDescription 'w2k22_Broker'
```

#### Windows - Server OS - FAS

```bash
/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx01F' --VCpu 4 --CoresPerSocket 2 --MemoryGB 4 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:37' --StorageName 'node4_ssd_sdb' --VmDescription 'w2k22_FAS'

/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx02F' --VCpu 4 --CoresPerSocket 2 --MemoryGB 4 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:38' --StorageName 'node4_ssd_sdd' --VmDescription 'w2k22_FAS'
```

#### Windows - Server OS - Misc / License Server

```bash
/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx01LD' --VCpu 4 --CoresPerSocket 2 --MemoryGB 4 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:31' --StorageName 'node4_ssd_sde' --VmDescription 'w2k22_License_Director'

/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx02LD' --VCpu 4 --CoresPerSocket 2 --MemoryGB 4 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:32' --StorageName 'node4_ssd_sdf' --VmDescription 'w2k22_License_Director'
```

#### Windows - Server OS - PVS

```bash
/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx01P' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:41' --StorageName 'node4_ssd_sde' --VmDescription 'w2k2_PVS'

/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx02P' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:42' --StorageName 'node4_ssd_sdf' --VmDescription 'w2k22_PVS'
```

#### Windows - Server OS - StoreFront

```bash
/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx01S' --VCpu 4 --CoresPerSocket 2 --MemoryGB 4 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:35' --StorageName 'node4_ssd_sdb' --VmDescription 'w2k22_storeFront'

/opt/scripts/vm_create_uefi.sh --VmName 'b2_ctx02S' --VCpu 4 --CoresPerSocket 2 --MemoryGB 4 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:36' --StorageName 'node4_ssd_sdd' --VmDescription 'w2k22_storeFront'
```

### CTX - VM Tools - Insert Media

#### CTX - VM Tools - 01

```bash
xe vm-cd-eject vm='b2_ctx01B'
xe vm-cd-insert vm='b2_ctx01B' cd-name='Citrix_Hypervisor_821_tools.iso'

xe vm-cd-eject vm='b2_ctx01F'
xe vm-cd-insert vm='b2_ctx01F' cd-name='Citrix_Hypervisor_821_tools.iso'

xe vm-cd-eject vm='b2_ctx01LD'
xe vm-cd-insert vm='b2_ctx01LD' cd-name='Citrix_Hypervisor_821_tools.iso'

xe vm-cd-eject vm='b2_ctx01P'
xe vm-cd-insert vm='b2_ctx01P' cd-name='Citrix_Hypervisor_821_tools.iso'

xe vm-cd-eject vm='b2_ctx01S'
xe vm-cd-insert vm='b2_ctx01S' cd-name='Citrix_Hypervisor_821_tools.iso'
```

#### CTX - VM Tools - 02

```bash
xe vm-cd-eject vm='b2_ctx02B'
xe vm-cd-insert vm='b2_ctx02B' cd-name='Citrix_Hypervisor_821_tools.iso'

xe vm-cd-eject vm='b2_ctx02F'
xe vm-cd-insert vm='b2_ctx02F' cd-name='Citrix_Hypervisor_821_tools.iso'

xe vm-cd-eject vm='b2_ctx02LD'
xe vm-cd-insert vm='b2_ctx02LD' cd-name='Citrix_Hypervisor_821_tools.iso'

xe vm-cd-eject vm='b2_ctx02P'
xe vm-cd-insert vm='b2_ctx02P' cd-name='Citrix_Hypervisor_821_tools.iso'

xe vm-cd-eject vm='b2_ctx02S'
xe vm-cd-insert vm='b2_ctx02S' cd-name='Citrix_Hypervisor_821_tools.iso'
```

### CTX - Initial Setup

https://github.com/makeitcloudy/HomeLab/blob/feature/007_DesiredStateConfiguration/_blogPost/README.md#run_initialsetupps1

It:
* install vmTools
* enables WinRM on Desktop OS
* it downloads PowerShell modules for further steps along with (AutomatedLab, AutomatedXCPng modueles)
* it does what is listed in paragraph 2.0.1 - https://makeitcloudy.pl/windows-preparation/

### CTX - VM Tools - Eject Media

#### CTX - VM tools - 01 - Eject Media

```bash
xe vm-cd-eject vm='b2_ctx01B'
xe vm-cd-eject vm='b2_ctx01F'
xe vm-cd-eject vm='b2_ctx01LD'
xe vm-cd-eject vm='b2_ctx01P'
xe vm-cd-eject vm='b2_ctx01S'
```

#### CTX - VM Tools - 02 - Eject Media

```bash
xe vm-cd-eject vm='b2_ctx02B'
xe vm-cd-eject vm='b2_ctx02F'
xe vm-cd-eject vm='b2_ctx02LD'
xe vm-cd-eject vm='b2_ctx02P'
xe vm-cd-eject vm='b2_ctx02S'
```

### CTX - VM Provisioning - Extra Steps

#### CTX - VM Provisioning - PVS - Add Disk

```bash
## Add Disk - Install XCP-ng tools upfront
# run over SSH
/opt/scripts/vm_add_disk.sh --vmName 'b2_ctx01P' --storageName 'node4_hdd_sdc_lsi' --diskName 'b2_ctx01P_PVSStoreDrive' --deviceId 4 --diskGB 300  --description 'b2_ctx01P_S_dataDrive'
/opt/scripts/vm_add_disk.sh --vmName 'b2_ctx02P' --storageName 'node4_hdd_sdc_lsi' --diskName 'b2_ctx02P_PVSStoreDrive' --deviceId 4 --diskGB 300  --description 'b2_ctx02P_S_dataDrive'
```

### CTX - Initial Setup - Domain Join

https://github.com/makeitcloudy/HomeLab/blob/feature/007_DesiredStateConfiguration/_blogPost/README.md#run_initialconfigdsc_domainps1

It:
* It initialize all variables for succesfull code execution
* It creates the folders structure for the DSC compilations, etc - $env:SYSTEMDRIVE\dsc
* It downloads the powershell functions and configuration
It configures the LCM
It starts the actual configuration of the node

* it does what is listed in paragraph 3.0 - https://makeitcloudy.pl/windows-DSC/

### CTX - Citrix Installation Media - Inject

#### CTX - Citrix Installation Media - 01

```bash
xe vm-cd-eject vm='b2_ctx01B'
xe vm-cd-insert vm='b2_ctx01B' cd-name='Citrix_Virtual_Apps_and_Desktops_7_1912.iso'
xe vm-cd-eject vm='b2_ctx01F'
xe vm-cd-insert vm='b2_ctx01F' cd-name='Citrix_Virtual_Apps_and_Desktops_7_1912.iso'
xe vm-cd-eject vm='b2_ctx01L'
xe vm-cd-insert vm='b2_ctx01L' cd-name='Citrix_Virtual_Apps_and_Desktops_7_1912.iso'
xe vm-cd-eject vm='b2_ctx01S'
xe vm-cd-insert vm='b2_ctx01S' cd-name='Citrix_Virtual_Apps_and_Desktops_7_1912.iso'

xe vm-cd-eject vm='b2_ctx01P'
xe vm-cd-insert vm='b2_ctx01P' cd-name='Citrix_Provisioning_1912.iso'

```

#### CTX - Citrix Installation Media - 02

```bash
xe vm-cd-eject vm='b2_ctx02B'
xe vm-cd-insert vm='b2_ctx02B' cd-name='Citrix_Virtual_Apps_and_Desktops_7_1912.iso'
xe vm-cd-eject vm='b2_ctx02F'
xe vm-cd-insert vm='b2_ctx02F' cd-name='Citrix_Virtual_Apps_and_Desktops_7_1912.iso'
xe vm-cd-eject vm='b2_ctx02L'
xe vm-cd-insert vm='b2_ctx02L' cd-name='Citrix_Virtual_Apps_and_Desktops_7_1912.iso'
xe vm-cd-eject vm='b2_ctx02S'
xe vm-cd-insert vm='b2_ctx02S' cd-name='Citrix_Virtual_Apps_and_Desktops_7_1912.iso'

xe vm-cd-eject vm='b2_ctx02P'
xe vm-cd-insert vm='b2_ctx02P' cd-name='Citrix_Provisioning_1912.iso'
```

### CTX - Citrix Installation Media - Eject

```bash
xe vm-cd-eject vm='b2_ctx01B'
xe vm-cd-eject vm='b2_ctx01F'
xe vm-cd-eject vm='b2_ctx01LD'
xe vm-cd-eject vm='b2_ctx01S'

xe vm-cd-eject vm='b2_ctx01P'

```

#### CTX - Citrix Installation Media - 02

```bash
xe vm-cd-eject vm='b2_ctx02B'
xe vm-cd-eject vm='b2_ctx02F'
xe vm-cd-eject vm='b2_ctx02LD'
xe vm-cd-eject vm='b2_ctx02S'

xe vm-cd-eject vm='b2_ctx02P'

```

### CTX - Target VM Provisioning - MCS

#### CTX - Target VM Provisioning - MCS - Server OS - w2k22 - UEFI

```bash
/opt/scripts/vm_create_uefi.sh --VmName '_imgMCSw10u' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:30' --StorageName 'node4_nvme' --VmDescription 'w2k22_gold_MCS_uefi'
```

#### CTX - Target VM Provisioning - MCS - Desktop - w10 - BIOS

```bash
# 2024.10.07 - iso for BIOS is not ready

/opt/scripts/vm_create_uefi.sh --VmName '_imgPVSw10b' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows 10 (64-bit)' --IsoName 'w10ent_21H2_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:33' --StorageName 'node4_nvme' --VmDescription 'w10_gold_MCS_bios'
```

#### CTX - Target VM Provisioning - MCS - Desktop - w10 - UEFI

```bash
/opt/scripts/vm_create_uefi.sh --VmName '_imgPVSw10u' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows 10 (64-bit)' --IsoName 'w10ent_21H2_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:34' --StorageName 'node4_nvme' --VmDescription 'w10_gold_MCS_uefi'
```

### CTX - Target VM Provisioning - PVS

#### CTX - Target VM Provisioning - PVS - ServerOS - w2k22 - BIOS

```bash
#2024.10.07 - the iso is not prepared for this usecase - yet
/opt/scripts/vm_create_uefi.sh --VmName '_imgPVSb' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_bios.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:35' --StorageName 'node4_ssd_sde' --VmDescription 'w2k22_target_PVS_bios'
```

#### CTX - Target VM Provisioning - PVS - ServerOS - w2k22 - UEFI

```bash
/opt/scripts/vm_create_uefi.sh --VmName '_imgPVSu' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:36' --StorageName 'node4_nvme' --VmDescription 'w2k22_target_PVS_uefi'
```

#### CTX - Target VM Provisioning - PVS - Desktop - w10 - BIOS

```bash
# 2024.10.07 - iso for BIOS is not ready

/opt/scripts/vm_create_uefi.sh --VmName '_imgPVSw10b' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows 10 (64-bit)' --IsoName 'w10ent_21H2_2410_untd_nprmpt_bios.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:37' --StorageName 'node4_nvme' --VmDescription 'w10_target_PVS_bios'
```

#### CTX - Target VM Provisioning - PVS - Desktop - w10 - UEFI

```bash
/opt/scripts/vm_create_uefi.sh --VmName '_imgPVSw10u' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows 10 (64-bit)' --IsoName 'w10ent_21H2_2410_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:38' --StorageName 'node4_nvme' --VmDescription 'w10_target_PVS_uefi'
```

#### CTX - Target VM Provisioning - PVS - Desktop - w11 - UEFI

```bash
# 2024.10.07 - upload w11 ISO

/opt/scripts/vm_create_uefi.sh --VmName '_imgPVSw11u' --VCpu 4 --CoresPerSocket 2 --MemoryGB 8 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows 10 (64-bit)' --IsoName '_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:39' --StorageName 'node4_nvme' --VmDescription 'w11_target_PVS_uefi'
```

## DaaS Extension

### Cloud Connector

### Windows - Server OS - 1x cloud connector - Desktop Experience

```bash
/opt/scripts/vm_create_uefi.sh --VmName 'b2_cc01' --VCpu 4 --CoresPerSocket 2 --MemoryGB 2 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2302_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:43' --StorageName 'node4_ssd_sdf' --VmDescription 'w2k22_cc01_cloudConnector'

/opt/scripts/vm_create_uefi.sh --VmName 'b2_cc02' --VCpu 4 --CoresPerSocket 2 --MemoryGB 2 --DiskGB 32 --ActivationExpiration 180 --TemplateName 'Windows Server 2022 (64-bit)' --IsoName 'w2k22dtc_2302_untd_nprmpt_uefi.iso' --IsoSRName 'node4_nfs' --NetworkName 'eth1-B2-vlan1342' --Mac '12:B2:13:42:02:44' --StorageName 'node4_ssd_sdg' --VmDescription 'w2k22_cc02_cloudConnector'

```

