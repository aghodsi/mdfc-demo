# Def4Cloud-Log4J

Description
-----------

This demo script allows you to execute a Log4J exploit of a vulnerable container with the aim to exfiltrate a sensitive file located on another server. The lateral movement from the exploited container to the target servers will be performed by leveraging a vulnerability in the nhttpd webservice.
The goal of this script is to provide a step-by-step guide to perform an attack and demonstrate how; Defender for Cloud and Microsoft Sentinel can detect and alert on these activities.

<img width="929" alt="image" src="https://user-images.githubusercontent.com/9025598/148679918-51ee7a58-0226-43d3-9ff2-73e49ac269f8.png">

Requirements
------------
To follow the steps within the commands.txt file it is required to create the following resources within your Azure subscription:

- 1X Virtual Network with three subnets clients/containers/servers
- 3X Application Security Groups clients/containers/servers
- 3X Network Security groups mapped to the 3 subnets and application groups
- 2x Linux Ubuntu 20.4 VM's (one attacker "SRV-UB-01" and victim "SRV-UB-02")
- 1x ACR (Azure Container Registry)
- 1x AKS cluster with a connection to the created ACR

The AKS cluster must be configured using an Azure CNI network configuration and mapped to the container subnet. See below example screenshot:

![image](https://user-images.githubusercontent.com/9025598/148650803-fe981310-a502-4809-922f-ab616b5285ef.png)

The application security groups should be used to block traffic from the client to server subnet. An example NSG rule is show below:

![image](https://user-images.githubusercontent.com/9025598/148650829-c389ea47-1eaf-481e-8cf4-b3820d8646d7.png)

This is needed to mimic network segregation between the systems.

Apart from the above resources, it is needed to deploy the following Security Solutions:

- Defender for cloud with minimum Defender for Server and Containers enables
- Defender for cloud autoenrollment for the monitoring agent, Defender for Servers and Vulnerability scan agents which can be either Qualys or TVM
- Microsoft Sentinel with default data connectors enabled (Azure Activity & AD, Azure AKS, Defender for Cloud and M365D)
- Within Microsoft Sentinel also enable the OOTB Log4J related alert rule templates

Security Note!
--------------
If you enable public IPs to access the Linux VM’s via SSH, make sure to limit access to your IP addresses only or enable JIT access!

As both the container and SRV-UB-02 server will be running with exploitable software do not expose the vulnerable ports to the internet!
Once the default requirements are met, please proceed with the steps outlined in the commands.txt file

Example results
---------------
Upon running through the steps, you will see Defender for Cloud and Microsoft Sentinel will provide the following indicators of the attack:

Defender for Cloud alert of a Log4J vulnerable container image
--------------------------------------------------------------

<img width="1057" alt="image" src="https://user-images.githubusercontent.com/9025598/148675383-eacebad2-43f6-4878-b691-7cc9749102c8.png">

Defender for Cloud alert examples
---------------------------------------------------------

<img width="1034" alt="image" src="https://user-images.githubusercontent.com/9025598/148675313-3f99b761-e8ad-45c5-a18c-d3caed0b68ca.png">

Microsoft Sentinel & Defender for Server Overview
--------------------------------------------------








