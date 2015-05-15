$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://files.programki.net/aimp/EDEE2EC04907D7AB64F2247F928C3D8E/aimp_3.60.1492.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
