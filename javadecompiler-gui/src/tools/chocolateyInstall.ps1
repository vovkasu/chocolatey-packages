$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'javadecompiler-gui'
  url           = 'https://github.com/java-decompiler/jd-gui/releases/download/v1.3.0/jd-gui-windows-1.3.0.zip'
  checksum      = '478ff198ed9c9a9945cc55ae1fb8b9b6'
  checksumType  = 'md5'
  unzipLocation = $toolsDir
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "$menuPrograms\Java Decompiler.lnk"
  targetPath       = "$toolsDir\jd-gui-windows-1.3.0\jd-gui.exe"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shotrcutArgs
