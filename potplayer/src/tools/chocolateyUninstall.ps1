$packageName = 'potplayer';
$installerType = 'exe';
$silentArgs = '/S';

try {
	$hklm = "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\PotPlayer";
	if (Get-ProcessorBits 64) {
	    $hklm = "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\PotPlayer64";
	}
	$file = (Get-ItemProperty -Path $hklm).UninstallString;
	Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -silentArgs $silentArgs -File $file;
  
	Write-ChocolateySuccess $packageName;
} catch {
	Write-ChocolateyFailure $packageName "$($_.Exception.Message)";
	throw;
}