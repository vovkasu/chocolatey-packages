$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://aimp.su/storage/d36cdde412041f71ff6953cf2ac73ce0/aimp_4.00.1680.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
