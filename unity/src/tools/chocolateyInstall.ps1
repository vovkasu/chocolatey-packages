$version = "5.3.5.1";
$versionName = "5.3.5f1";
$buildName = "960ebf59018a";
$packageName = 'unity';
$installerType = 'exe';
$url =      "http://download.unity3d.com/download_unity/{0}/Windows32EditorInstaller/UnitySetup32-{1}.exe" -f $buildName,$versionName;
$url64bit = "http://download.unity3d.com/download_unity/{0}/Windows64EditorInstaller/UnitySetup64-{1}.exe" -f $buildName,$versionName;
$silentArgs = '/S';
$validExitCodes = @(0);

Install-ChocolateyPackage -packageName $packageName -fileType $installerType -silentArgs $silentArgs -url $url -url64bit $url64bit -validExitCodes $validExitCodes;
