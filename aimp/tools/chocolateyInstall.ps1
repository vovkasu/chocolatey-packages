$ErrorActionPreference = 'Stop'

$packageName = 'aimp';
$url32 = 'https://www.aimp.ru/?do=download.file&id=4';
          
$checksum32  = '82283682e394fd647a85406f5d246efbdac690b3ef4c143c061e3125c18fdc1d'

$silentArgs = "/SILENT /AUTO";


$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url32
  checksum               = $checksum32
  checksumType           = 'sha256'
  silentArgs             = $silentArgs
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs;
