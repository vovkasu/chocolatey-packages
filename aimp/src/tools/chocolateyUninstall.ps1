$packageName = 'aimp';
$installerType = 'exe';
$validExitCodes = @(0);

try {
	$file = (Get-ItemProperty -Path "hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\AIMP3").UninstallString;
	Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -validExitCodes $validExitCodes -File $file;
  
	Write-ChocolateySuccess $packageName;
} catch {
	Write-ChocolateyFailure $packageName "$($_.Exception.Message)";
	throw;
}