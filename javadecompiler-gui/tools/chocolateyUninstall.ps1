$version = '1.6.6'

$packageArgs = @{
  packageName = 'javadecompiler-gui'
  zipFileName = 'jd-gui-windows-$version.zip'
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Java Decompiler.lnk"

UnInstall-ChocolateyZipPackage @packageArgs
If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
