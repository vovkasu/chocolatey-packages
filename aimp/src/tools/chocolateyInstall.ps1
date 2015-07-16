$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://files.programki.net/aimp/70005f20f33f6599d8a58e5bfd8a17f4/aimp_3.60.1497.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
