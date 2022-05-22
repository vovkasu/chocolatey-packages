$ErrorActionPreference = 'Stop'

$packageName = 'aimp';
$url32 = 'https://aimp.ru/files/windows/builds/aimp_5.02.2370.exe';
          
$checksum32  = ''

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
