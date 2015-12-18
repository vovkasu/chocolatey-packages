$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://files.programki.net/aimp/cae7750f32cfceb0f8732b3fa2c9a053/aimp_4.00.1678.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
