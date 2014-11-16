$packageName = 'unity3d';
$installerType = 'exe';
$silentArgs = '/S';

try {
	$file = (Get-ItemProperty -Path "hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Unity").UninstallString;
	Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -silentArgs $silentArgs -File $file;
  
	Write-ChocolateySuccess $packageName;
} catch {
	Write-ChocolateyFailure $packageName "$($_.Exception.Message)";
	throw;
}