$ErrorActionPreference = 'Stop'

$packageName = 'aimp';
$url32 = 'http://aimp.su/storage/5a11962272e8dc7777525fd878e95e5d/aimp_4.51.2080.exe';
          
$checksum32  = '5a11962272e8dc7777525fd878e95e5d'

$silentArgs = "/SILENT /AUTO";


$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url32
  checksum               = $checksum32
  checksumType           = 'md5'
  silentArgs             = $silentArgs
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs;
