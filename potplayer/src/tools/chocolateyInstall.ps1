$packageName = 'potplayer';
$installerType = 'exe';
$url = 'http://get.daum.net/PotPlayer/v3/PotPlayerSetup.exe';
$url64 = 'http://get.daum.net/PotPlayer64/v3/PotPlayerSetup64.exe';

$silentArgs = '/S';
$validExitCodes = @(0);

Install-ChocolateyPackage -packageName $packageName -fileType $installerType -silentArgs $silentArgs -url $url -url64bit $url64  -validExitCodes $validExitCodes;
