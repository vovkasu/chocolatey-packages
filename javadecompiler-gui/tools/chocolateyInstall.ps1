$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url32 = 'https://github.com:443/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-windows-1.6.6.zip';
$checksum32  = '79c231399d3d39d14fce7607728336acb47a6e02e9e1c5f2fa16e2450c0c46cb';
$checksum32Type  = 'sha256';
$version = '1.6.6'

$packageArgs = @{
  packageName   = 'javadecompiler-gui'
  url           = $url32
  checksum      = $checksum32
  checksumType  = $checksum32Type
  unzipLocation = $toolsDir
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "$menuPrograms\Java Decompiler.lnk"
  targetPath       = "$toolsDir\jd-gui-windows-$version\jd-gui.exe"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shotrcutArgs
