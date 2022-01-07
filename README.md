# Def4Cloud-Log4J

Description
-----------

This demo script allows you to execute a Log4J exploit of a vulnerable container after which a sensitive file is exfiltrated from a server by exploiting a nhttpd vulnerability.
The goal of this script is to provide an example of how; Defender for Cloud, Defender for Server and Microsoft Sentinel can detect and alert on such activities.

Requirements
------------

This demo requires the following resources to be create in your Azure subscription:
1X Virtual Network with three subnets clients/containers/servers
3X Application Security Groups clients/containers/servers
3X Network Security groups mapped to the 3 subnets and application groups
2x Linux Ubuntu 20.4 VM's (one attacker "SRV-UB-01" and victim "SRV-UB-02")
1x ACR
1x AKS cluster with a connection to the created ACR with CIDR network configuration. The AKS cluster should use the container subnet

-For security reasons make sure both Ubuntu Linux VM are only accessible via SSH from your IP address
-Your subscription needs to have Defender for Cloud enabled for Servers & Containers
-Your subscription should also have Sentinel enabled with all default data connectors: Defender for Cloud, M365D, Azure Activity, Azure AD etc. enabled

Once the default requirements are met please proceed with the steps outlined in the commands.txt file

Example results
---------------
Upon running through the steps you will see Defender for Cloud, Defender for Server and Microsoft Sentinel will provide the following indicators of the attack:

Defender for Cloud alert of a Log4J vulnerable container image
--------------------------------------------------------------
![image](https://user-images.githubusercontent.com/9025598/148591135-a94a39d0-9f23-4d8f-83a0-4d9a3cd6a1f1.png)


