$packageArgs = @{
  packageName = 'javadecompiler-gui'
  zipFileName = 'jd-gui-windows-1.4.0.zip'
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Java Decompiler.lnk"

UnInstall-ChocolateyZipPackage @packageArgs
If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
