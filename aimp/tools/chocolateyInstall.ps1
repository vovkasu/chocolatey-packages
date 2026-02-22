$ErrorActionPreference = 'Stop'

$packageName = 'aimp';
$url32 = 'https://aimp.ru/files/windows/builds/aimp_5.40.2703_w32.exe';
          
$checksum32 = '50c3aedab55aa7263284d9761868e344e7f174aff205f5af95e30548dab9ca30';

$url64 = 'https://aimp.ru/files/windows/builds/aimp_5.40.2703_w64.exe';
          
$checksum64 = '080981925a962749e2b99b10b6a199204ef4fc9d5b836dca7415db96e77ef8ef';


$silentArgs = "/SILENT /AUTO";


$packageArgs = @{
  PackageName            = $packageName
  FileType               = 'EXE'

  Url                    = $url32
  Checksum               = $checksum32
  ChecksumType           = 'sha256'

  Url64bit               = $url64
  Checksum64             = $checksum64
  ChecksumType64         = 'sha256'

  SilentArgs             = $silentArgs
  ValidExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs;
