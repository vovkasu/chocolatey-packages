$ErrorActionPreference = 'Stop'

$packageName = 'aimp';
$url32 = 'https://aimp.ru/files/windows/builds/aimp_5.02.2365.exe';
          
$checksum32  = '754fa1b5229abb5845418c5fe98cb8fe5378a63ef1137bc36c5ae2bea0cf134d'

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
