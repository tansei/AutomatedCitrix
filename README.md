# AutomatedCitrix

Some could say CVAD (Citrix Virtual Apps and Desktops), never the less I will stick with the first string from the product name only, as you'll neve know when the current name become the relict of the past. Where the word Citrix is still with us since 20y.<br>

Okay so you decided to spend some time with this product, but you do not want spend too much of your precious time with setting up the vm's at first place..
You may ask, where to start, well the knowledge is scattered over the internet, it's just perfectly schattered into pieces, there are few well known places which tries to accomodate the most important details in one place, one of them is Carl Stalhood (https://www.carlstalhood.com/), he rocks. It all goes with experience, but still the best way to learn something is to give it a spin and at least try and fail, without giving up.<br>

Below are areas which should be taken into account, along with my attempt to give some insight to those of you who may be seeking for those type of details, and are curious about the possibilities. It does not gather are possibilities, as each scenario and homelab is different and there are so many possibilities that here I'm basing on my own experience.<br>

1. Think of the hypervisor vendor, you'll bring into your lab. Your option may be xcp-ng (https://xcp-ng.org/). It's free, it's based on Xen. Surely you may consider Azure, but at the time of writing this, nested virtualization for the giant's world where we are with citrix is not very well suited with Azure Labs. If you count the cost of storage and compute, it may not be that cheap overall, especially if you spend time doing things manually. It seems that your first hard stop may be with the space on the storage. That's why for fresh home labbers I'm still opting for energy efficient solution which is based on-premise. In my opinion clouds are towards contenerization and webservices which scales far better than virtual machine based scenarios.
2. Consider 10G network connectivity for your storage, then the provisioning should be much faster. Unless you got it virtualized already, and you dont' have to take care about this aspect.
3. Consider splitting your regular network for the VM traffic, that you end up with different possible scenarios for deployment (especially if you are interested with ending up with more than one site), and some specific use cases.
4. Think about the PKI infrastructure, then you can get some hands on experience with FAS (Federated Authentication Services), TLS 1.x - and you'll gain some hands on experience with openSSL, and you can take the benefit of that piece for the regular RDS (Remote Desktop Infrastructure).
5. Check the internet against the possibility of spinnig up Remote Desktop Services Session Hosts, with the regular PVS (Citrix Provisioning Services) infrastructure. Please check the licensing constrains, which will help you assessing which version of the PVS you may be utilizing for the usecase. There are/were some differences..
6. Consider the Freemium version of the Citrix Netscaler (Citrix ADC), starting version 13.0 of the product, the freemium version equals with the features previous standard releases, so it should at least give you the possibilities to get some hands on experience with SSL offloading, Load Balancing, Context switching, and some other interesting things, without a chance to set the Gateway for your CVAD infrastructure... Let's see what the 2022 bring for home labbers as Citrix is promissing some improvements in that area, and some special licenses / options.
7. Consider preparing the unattended iso's for the Server and Desktop OS'es - it will help you spinning up new vm's.
8. Consider automating the deployment of the core elements which are the backbone of your VM infrastructure, like AD, GPO's, certificates and other stuff which will come into play, especially when in disposal of 180days evaluation products. Time is passing by fast, especially when you try to keep up in balance. Stil IaC (Infrastructure as a Code) which is your goal, requires a lot of work, and it does not often scales well, but stil better than manual clicks.
9. If you think about going hybrid for the WVD (Windows Virtual Desktop) usecase, bare in mind Azure Ephemeral Disks.
10. Applications - There is AppLayering from citrix, never the less let's be fair, I have not seen a vendor who is doing all the things right and have the best possible solutions to spin up the environment, especially considering such amount of usecases, and such amount of different angles. It has been said, if you decide to go with AppLayering then you should cover all your apps. The question is how much effort will that cost you comparing to other solutions available on the market like App-v or SCCM/MEM or rewriting those to be served as web apps. It's hard to suggest anything here, but bare in mind the binary methodology here 1 or 0. The worse thing you can do for yourself is to bring different ways of provisioning for your applicaiton layer. Keep it simple, and tend to use solutions which will last.<br><br>

**(1)** Xcp-ng is based on RedHat, like regular XenServer is. In case you are still using windows desktop as your management station, there is an option called (https://github.com/xcp-ng/xenadmin/releases). Bare in mind that there are no toos available for windows VM which runs on top of xcp-ng, but in case you are so fortunate and have a mycitrix account, there is an option for you, to get rid of that issue, unless this is prevented. Apart from that if you decide to stick with the original stack, and you won't mix vmware, nutanix, or hyper-v with CVAD's, then you can take the benefit from the Citrix Hypervisor SDK (available in PowerShell) which will allow you automating the provisioning of the VM's, so you don't have to click within the XenCenter / XenAdmin Centre. The Xen API does not belong to the easiest one, especially if you decide to perform something a bit more complicated. Thankfully there are github projects like ALX wchich may help you constructing your own functions which are hopefully idempotent.<br>

**(2)** If you decide to go with physical route for your network infrastructure, there are great second hand product available, like aruba switches (10G switches ethernet based) and not yet that cheap in 2021. In short distances, DAC (Direct Attach Coooper) would be better choice, than going with transceivers and using light. Mellanox Connect cards may support you, those are still easily recognizable by linux and windows (at least in 2021). I'm not a big fan of having plenty of different vendors which compose your infrastructure, as it causes life even more interesting, so maybe it is a good idea to stick with mikrotik products with their series of CRS-3XX. With RouterOS which give you possibility to manage via winbox or ssh, those can act as L2 on the bridge level if you configure vlans, and only the logical interface of the device itself, which allows you managing it will reside in L3. The configuration from ground zero is a bit tricky for w newbe, never the less the overall performance for the price is not too bad for a home lab. On top of your switching network you'll still need a router, may be virtualized on a stick or again some physical hardware. In case your architecture require much of bandwidth being routed between vlans then CCR (Cloud Core) series for the rescue. In case it is not, then VyOs or pfSense should be enough.<br>

**(3)** Your network topology can helping you emulate different sites, instead of keeping each element in the same broadcast domain. It will also help you setting up the firewall or observe what type of traffic is being spread from particular elements of your infrastructure. Similar can be achieved with Wireshark or uberAgent  directly on the VM's, but it seems that proper network topology with VLAN's will help you anyway. In case Mikrotik is your choice, there is great channel on youtube called *The Network Berg*, who offers Free MCTNA course, covering the content which will be sufficient to setup the network infrastructure for your homelab, and more (https://www.youtube.com/watch?v=a_XTHHPXbuk&list=PLJ7SGFemsLl3XQhO8g0hHCrKnC6J3KURk).<br>

**(4)** SQL is brain of your CVAD infrastructure, automating (https://ali-ahmed-jdawms.medium.com/how-to-perform-sql-server-2019-developer-edition-unattended-silent-installation-354f6341dfc7). For Citrix you'll need SQL Standard or more in case Alwasy On cluster is taken into account.<br>

**(5)** There is a great book from Freek Berson (https://github.com/fberson) and Claudio Rodrigues - RDS - The Complete Guide: Everything you need to know about RDS. And more. - (https://www.amazon.com/RDS-Complete-Guide-Everything-about-ebook/dp/B07C6849WD/ref=sr_1_1?ie=UTF8&qid=1525462416&sr=8-1&keywords=rds+complete+guide). Installation of the RDS was also automated with AutomatedRDS and some other projects in the internet. On top of that the configuration piece is left for you. Configuring the windows 10 for the SSO (Single Sing On) experience on top of RDS, will make you busy. As it was said, you may let the cogel mogel begins, by provisioning the RDSH (Remote Session Hosts) by PVS (Citrix Provisioning Services) which is not a bad idea, especially for RDS infrastructures which have plenty of Collections.<br>
Apart from that there is a great resource for the FMA (Flexcast Management Architecture) offered for free which is a fruit of all the efforts but into it by Bas van Kaam (https://www.basvankaam.com/2016/12/15/the-citrix-xenapp-xendesktop-fma-services-complete-overview-new-7-12-services-included/), available here (https://www.basvankaam.com/wp-content/uploads/2019/03/Inside-Citrix-The-FlexCast-Management-Architecture.pdf). Big Kudos!<br>

**(6)** With Fremium you'll gain some hands on experience with the Citrix ADC which is FreeBSD based. Even if you give up with CVAD, at least you may have some interesting time with certificates, perform a lot of binding, and HTTP/HTTPS protocol itself.<br>

**(7)** Unattended file, if this is home lab, you'll find plenty of examples in the internet with the GVLK keys (https://docs.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys), please do not follow them. If you decide constructing your xml answer file, leave this parameter blank, and focus on updating the .wim file with OSD from Mr. Segura (https://osdupdate.osdeploy.com/) - who brought this fantastic product which will save your time and make your life easier.<br>
*** OSBuilder *** - (https://osbuilder.osdeploy.com/docs)<br>

Once you download the image of your LTSC windows release, it will contain Standard and Datacenter versions, in Core (no GUI - Graphical User Interface in windows) and Desktop Experience (GUI which you got used to during all the years). The sources can be downloaded from the Microsoft webpage (https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019), the downloaded iso will contain the .wim file. If you decide to use another ways, like Windows Media Creation Tool, then you'll end up with the iso or other format, which contain .esd file instead of .wim file. Up to my knowledge, you'll have to convert it to .wim if you'd like to make use of it in Windows ADK. ADK goes hand in hand with releases of windows, there is different verison of ADK for 2022, 2019, 2012R2 etc. ADK details can be found here (https://docs.microsoft.com/pl-pl/windows-hardware/get-started/what-s-new-in-kits-and-tools).<br>
In case you consider downloading a bunch of windows releases there is an interesting project (https://github.com/AveYo/MediaCreationTool.bat) - it should save you some struggle and time.<br>

A bit of powershell will give you the possibility to remove the versions of the OS release you are not going to use in your lab. Please consider Core, your skills and OS understanding will raise, and you'll gain a better understanding how does the system work.<br>
Few elements in your citrix home lab may be based on core editions of the windows servers. If I'm not mistaken it is advised to put your PKI on servers with Desktop Based experience, but elements like your domain controllers, citrix license servers may run on core. You may be tempted to use Windows Admin Center - it has great marketing, but still left much to be desired, so please follow the route of combining old and still good mmc's along with Server Manager, anlong with RSAT tools, which may reside on your management machine. The machine may be desktop based.<br>

Good starting point for the automated answer file is this link: (https://www.windowscentral.com/how-create-unattended-media-do-automated-installation-windows-10), it will help you creating the correct structure, and give you some bit of understanding, how does those windows popping up during the installation, reflects the xml structure. UEFI needs 4 partitions, BIOS boot 2. There are two approaches, you can follow the path of templates on the hypervisor level, or the automated installation of a regular machine without any customizations and on top of that execute a bit of DSC (Desired State Configuration), choice is yours. My preference is second option as then you are not tight to the hypervisor and it is a bit easier at the end, even though it cost you more work at the beggining.
As of the unattended xml creation, this blog is also great help (https://taylor.dev/how-to-create-an-automated-install-for-windows-server-2019/)<br>

Once the VM's are installed, if you search for particular KB or Cummulative update, like the one for .NET those can be found here (https://www.catalog.update.microsoft.com/Search.aspx?q=windows%20Server%202016%20framework)<br><br>

**(8)** Depending from the scenario, there are solutions which are worse and better match. Powershell for the rescue in MS world, that's for sure, still some products like MEM (Microsoft Endpoint Manager) may help you managint Microsoft Endpoints, MDT (Microsoft Deployment Toolkit) or modules brought by the communities within the PowerShell Gallery itself. First you need to find them, and get a bit of hands on experience, as not all of them are very well documented, never the less again in some cases getting them to know, will pay you off with some time savings.<br>
Atomizing actions within your scripts is your way to go, do not put to much of features into one function / script, as it make your life harder. It's easier to say than do, but it will come with the pitfals made during your attempts. Let those objects created within your code be passed in the pipeline, and be consumed by another tool which fits the purpose.<br>
Starting from scratch will cost you a great amount of effort, so take the benefit of community work and great guys which shares with us their knowledge and efforts produced very often in nights, and dozen of attempts to make it work. Frequently, what they share is extra work, brought to us apart from their regular full time jobs.<br>
It may be hard to start directly from IaC (Infrastructure as Code), but there are products like Hydration Kits (https://www.deploymentresearch.com/hydration-kit-for-windows-server-2019-sql-server-2017-and-configmgr-current-branch/) along with some customizations like (https://github.com/JM2K69/HydrationKit).
If you prefer staying the purist, then your option is DSC, there are plenty of modules available behind a bit of a learning curve. It's worth spending some time with it, as it brings idempotency, it scales quite well and once you get handy with it your lab, it can be consumed in Azure.<br><br>

**(9)** When you consider Hybrid scenario and falling apart from regular love shared with CVAD by getting closer to WVD, get a bit familiar with storage solutions on Azure with the Azure Ephemeral Disks - (https://getnerdio.com/academy/azure-ephemeral-os-disks-what-are-they-and-how-do-they-benefit-msps/). Nerdio should also ring the bell, there are great guys behind the scenes. Freek Berson shines here again with his bicep, which will make your life easier with ARM templates (https://github.com/Azure/bicep).<br>

** AD / AD - Ask the Directory Services Team ** - (https://docs.microsoft.com/en-us/archive/blogs/askds/configuring-an-authoritative-time-server-with-group-policy-using-wmi-filtering)<br>
** AD / Carl Webster Active Directory Presentations ** - (https://carlwebster.com/category/conference-presentations/)<br>
** AD / GPO Automation ** - (https://jm2k69.github.io/2020/02/GPO-from-zero-to-hero-GPO-and-PowerShell.html)<br>
** AD / GPO Automation ** - (https://carlwebster.com/creating-a-group-policy-using-microsoft-powershell-to-configure-the-authoritative-time-server/)
** AD / GPO ** - (https://admx.help) | (https://pspeditor.azurewebsites.net/)<br>
** AD / GPO Troubleshooting ** - (https://evotec.xyz/the-only-command-you-will-ever-need-to-understand-and-fix-your-group-policies-gpo/)
** Hybrid / Trond advises for building hybrid scenarios ** - (https://xenappblog.com/2021/building-hybrid-cloud-on-nutanix-community-edition/)<br>
** Cloud / WVD (Windows Virtual Desktop) - AIB | (Azure Image Builder) vs Packer ** - (https://www.youtube.com/channel/UCjUtHlDsAIasXffpiORfwUA) and (https://github.com/JimMoyle/YouTube-WVD-Image-Deployment)<br>
** Image Preparation ** - BIS-F (https://eucweb.com/download-bis-f | https://github.com/EUCweb/BIS-F) - big thank you to Mathias and all guys who brought this to life <br>
** Image Preparation ** - Evergreen (https://github.com/Deyda/Evergreen-Script | https://github.com/aaronparker/Evergreen)<br>
** Profiles ** - (https://github.com/FSLogix) | UPD | massive products like Ivanti | Roaming Mandatory Profiles<br>
** OS Layer / Uber Agent ** - (https://uberagent.com/download/) - Helge Klein - (https://helgeklein.com/) shares great insights, worth following him <br><br>
** WMI / CMI is your friend ** - (https://0xinfection.github.io/posts/wmi-basics-part-1/)<br>

**Product documentation**<br>
** *Citrix Tech Zone* ** - (https://docs.citrix.com/en-us/tech-zone/build/deployment-guides/windows-10-deployment.html?utm_content=buffere2e95&utm_medium=social%2520media%2520-%2520organic&utm_source=twitter&utm_campaign=CVAD)<br>

**Books**<br>
+ https://www.basvankaam.com/wp-content/uploads/2019/03/Inside-Citrix-The-FlexCast-Management-Architecture.pdf<br>
+ https://www.amazon.com/RDS-Complete-Guide-Everything-about-ebook/dp/B07C6849WD/ref=sr_1_1?ie=UTF8&qid=1525462416&sr=8-1&keywords=rds+complete+guide<br>
+ https://www.manning.com/books/learn-windows-iis-in-a-month-of-lunches *month of launches series*
+ https://www.manning.com/books/learn-powershell-in-a-month-of-lunches?query=powershell%20in%20month *month of launches series*
+ https://www.manning.com/books/learn-powershell-scripting-in-a-month-of-lunches?query=powershell%20in%20month *month of launches series*
+ https://leanpub.com/the-dsc-book<br>
+ https://leanpub.com/pesterbook<br>
+ https://leanpub.com/thebigbookofpowershellerrorhandling<br>
+ https://leanpub.com/powershell101<br>
+ https://leanpub.com/azurebicep<br>

**Supportive channels which can help you gaining structuralized content**<br>
+ https://www.pluralsight.com/ along with their full time author and evangelist Greg Shields and his great courses - he will share a virtual hand and equip you with brilliant tips, helping you going through the installations and configurations of your virtual estate. Extremely patient guy, who is not scared of repeating the same things and topics as many times until your subscription expires.<br>
+ https://www.youtube.com/ - search for the sesoins of Cláudio Rodrigues, in youtube you'll have to follow his name with BriForum suffix, otherwise you'll be shown with non relevant materials, time is passing by fast, but in context of EUC this guy had and has very much to say - referencing video from 2012 (https://www.youtube.com/watch?v=msK6n7049ig). It's a pity he is no longer a regular EUC contractor, as it was very interesting to read his opinions comming from the field. This session from 10y ago is really good even though it is almost an extinct spieces ;). <br>
+ https://www.youtube.com/user/briforum - BriForum sessions may be a great foreground for a newcomer, there is dozens of details shared by EUC (End User Computing) engaged colleagues, which can help laying down some foreground for the newer knowledge. Bare in mind that the products by itself didn't changed that much. It's rather the Access Layer which is evolving by prism of Authorization, Authentication and Zero Trust.<br>
+ https://github.com/yt-dlp/yt-dlp - this will support your youtube activities<br><br>

**Podcast**<br>
+ https://www.eucdigest.com/episodes/<br>
+ https://cloudskills.fm/<br>
+ https://runasradio.com/<br>

**Conferences**<br>
+ https://cloudcamp.ie/<br>

**Community shares**<br>
* There is an interesting mission behind the scenes - https://www.go-euc.com/<br>
Two Carl's - let's list them alphabetically: Carl Webster and Carl Stalhood<br>
* Building Carl Webster lab - (https://carlwebster.com/01-building-websters-lab-v2-introduction/ | https://carlwebster.com/building-websters-lab-v2-pdf/) - his guide contains 1335 pages. Imagine how much of an errort was made to bring this to life. It's available for free...<br>
* Carl Stalhood - (https://www.carlstalhood.com/about-carl-stalhood/) - great resources and fair amount of links to different places which may help you getting up to speed, and solving many of the issues which may arise. It will also help installing the product itslef.<br>
* Bas van Kaam - (https://www.basvankaam.com/) - he is one of the Nerdio evangelist, who shared great green book called the FMA Architecture.<br>
* Denis Span - (https://dennisspan.com/) - he was my inspiration for some automation topics around PVS etc. His blog is full of examples how the installation of the components building CVAD can be automated. You may customize those scripts for your preference, for instance including the Error and Verbose streams, they are great starting point.<br>
* Julien Mooren - (https://citrixguyblog.com | https://github.com/citrixguyblog) - he was my inspiration to fork his AutomatedRDS release back in 2017.<br>
* Claudio Rodriguez - (http://blog.wtslabs.com/), apart from that there were RAS university initiative (http://ras.euc.university/) - but for some reason this is no longer active<br>
* Guy Leech - (https://twitter.com/guyrleech) - there is no better place to be inspired in powershell area ;)<br>
* Johannes Norz - (https://norz.at/blog | https://www.wonderkitchen.tech/) - here you can benefit for your Citrix ADC skilset<br>
* Dennis Mohrmann - (https://github.com/Mohrpheus78/)<br>
* George Spiers - (https://www.jgspiers.com/) - his blog will help you getting handy with NetScaler and topics on your OS layer<br>
* Lee Jeffries - https://www.leeejeffries.com/blog/<br>

**.**<br>
+ https://freedns.afraid.org/subdomain/ - fantastic freeDNS service
+ https://www.cloudflare.com/ - can bring great improvement for your web services
