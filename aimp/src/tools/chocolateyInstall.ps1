$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://aimp.su/storage/5bdbb4e235cf2191f91539562e813011/aimp_4.02.1725.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes

