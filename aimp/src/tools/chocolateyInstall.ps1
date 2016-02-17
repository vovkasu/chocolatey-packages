$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://aimp.su/storage/2d71869cdaf28f53c1d93c3cd5085063/aimp_4.00.1695.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
