$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://files.programki.net/aimp/1cdf331c2ed30014f81a6b29ece49a7d/aimp_3.60.1495.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
