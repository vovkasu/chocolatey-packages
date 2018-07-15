$packageName = 'aimp';
$installerType = 'exe';
$validExitCodes = @(0);

try {
	$hklm = "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\AIMP";
	if (Get-ProcessorBits 64) {
  		$hklm = "hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\AIMP";
	}
	$file = (Get-ItemProperty -Path $hklm).UninstallString;
	Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -validExitCodes $validExitCodes -File $file;
  
	Write-ChocolateySuccess $packageName;
} catch {
throw $_.Exception
}
