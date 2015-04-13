$packageName = 'unity';
$installerType = 'exe';
$silentArgs = '/S';

try {
	$hklm = "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Unity (32-bit)";

	if (Get-ProcessorBits 64) {
  		$hklm = "hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Unity";
	}
	$file = (Get-ItemProperty -Path $hklm).UninstallString;
	Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -silentArgs $silentArgs -File $file;
  
	Write-ChocolateySuccess $packageName;
} catch {
	Write-ChocolateyFailure $packageName "$($_.Exception.Message)";
	throw;
}