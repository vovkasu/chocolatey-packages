$packageName = 'aimp';
$installerType = 'exe';
$url = 'http://aimp.su/storage/3f54ed23203a5fdbb47fe5842d7ab203/aimp_4.00.1683.exe';
$validExitCodes = @(0);

$targetPath = $env:ProgramFiles;
if (Get-ProcessorBits 64) {
  $targetPath = ${env:ProgramFiles(x86)};
}

$silentArgs = "/SILENT /AUTO='$targetPath\AIMP3'";

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
