# Def4Cloud-Log4J

Description
-----------

This demo script allows you to execute a Log4J exploit of a vulnerable container with the aim to exfiltrate a sensitive file located on another server. The lateral movement from the exploited container to the target servers will be performed by leveraging a vulnerability in the nhttpd webservice.
The goal of this script is to provide a step-by-step guide to perform an attack and demonstrate how; Defender for Cloud and Microsoft Sentinel can detect and alert on these activities.

![image](https://user-images.githubusercontent.com/9025598/148650778-d15ccfe4-40cf-42fc-a9d3-4526bf1235ec.png)

Requirements
------------
To follow the steps within the commands.txt file it is required to create the following resources within your Azure subscription:
•	1X Virtual Network with three subnets clients/containers/servers
•	3X Application Security Groups clients/containers/servers
•	3X Network Security groups mapped to the 3 subnets and application groups
•	2x Linux Ubuntu 20.4 VM's (one attacker "SRV-UB-01" and victim "SRV-UB-02")
•	1x ACR (Azure Container Registry)
•	1x AKS cluster with a connection to the created ACR
The AKS cluster must be configured using an Azure CNI network configuration and mapped to the container subnet. See below example screenshot:



Example results
---------------
Upon running through the steps you will see Defender for Cloud, Defender for Server and Microsoft Sentinel will provide the following indicators of the attack:

Defender for Cloud alert of a Log4J vulnerable container image
--------------------------------------------------------------

![image](https://user-images.githubusercontent.com/9025598/148591135-a94a39d0-9f23-4d8f-83a0-4d9a3cd6a1f1.png)

Defender for Cloud AKS Cluster and Image recommendations
---------------------------------------------------------

![image](https://user-images.githubusercontent.com/9025598/148594118-9d41c061-7611-4ccd-8742-89c0e2f12659.png)


Defender for Cloud Alert overview
----------------------------------

![image](https://user-images.githubusercontent.com/9025598/148595038-1fea7398-9813-4960-acca-4ffd80105b25.png)

Security Alert detected on AKS Cluster
---------------------------------------
![image](https://user-images.githubusercontent.com/9025598/148595407-ec035078-b211-496f-ab57-ca95a7065b13.png)

Security Alert Detected on AKS Cluster
--------------------------------------

![image](https://user-images.githubusercontent.com/9025598/148595609-8c01ffab-69b7-42d9-a5d7-386e287e0651.png)

Security Alert detecting reverse shell
--------------------------------------

![image](https://user-images.githubusercontent.com/9025598/148595822-056ce0bd-97f6-4c93-afee-70cb733d639e.png)





