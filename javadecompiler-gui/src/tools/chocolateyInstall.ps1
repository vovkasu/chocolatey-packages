
$version = '0.3.6';
$packageName = 'javadecompiler-gui'; # arbitrary name for the package, used in messages
$url = 'http://jd.benow.ca/jd-gui/downloads/jd-gui-${version}.windows.zip'; # download url
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)";

try { 

  Install-ChocolateyZipPackage $packageName $url $unzipLocation;

  Install-ChocolateyShortcut -shortcutFilePath "$([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::StartMenu))\Programs\JavaDecompiler.lnk" -targetPath "${unzipLocation}\jd-gui.exe";
  # This will create a new shortcut at the location of "C:\test.lnk" and link to the file located at "C:\text.exe"

  Write-ChocolateySuccess "$packageName";
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)";
  throw;
}
