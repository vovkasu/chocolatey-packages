
$version = '1.2.0';
$packageName = 'javadecompiler-gui'; # arbitrary name for the package, used in messages
$url = "https://github.com/java-decompiler/jd-gui/releases/download/v1.2.0/jd-gui-windows-1.2.0.zip";

$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)";
$shortcutFilePath = "$([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::StartMenu))\Programs\JavaDecompiler.lnk";
$targetPath = "${unzipLocation}\jd-gui.exe";

try { 

  Install-ChocolateyZipPackage $packageName $url $unzipLocation;

  $global:WshShell = New-Object -com "WScript.Shell"
  $lnk = $global:WshShell.CreateShortcut($shortcutFilePath)
  $lnk.TargetPath = $targetPath
  $lnk.Save()

  #Install-ChocolateyShortcut -shortcutFilePath "$([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::StartMenu))\Programs\JavaDecompiler.lnk" -targetPath "${unzipLocation}\jd-gui.exe";
  # This will create a new shortcut at the location of "C:\test.lnk" and link to the file located at "C:\text.exe"

  Write-ChocolateySuccess "$packageName";
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)";
  throw;
}
