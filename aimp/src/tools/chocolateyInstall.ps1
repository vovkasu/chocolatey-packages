$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://files.programki.net/aimp/e3e4221f829ec5c0124041b196771ee1/aimp_3.60.1503.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
