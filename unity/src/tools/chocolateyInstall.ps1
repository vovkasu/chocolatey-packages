$version = "5.3.1";
$versionName = "5.3.1f1";
$buildName = "cc9cbbcc37b4";
$packageName = 'unity';
$installerType = 'exe';
$url =      "http://netstorage.unity3d.com/unity/{0}/Windows32EditorInstaller/UnitySetup32-{1}.exe" -f $buildName,$versionName;
$url64bit = "http://netstorage.unity3d.com/unity/{0}/Windows64EditorInstaller/UnitySetup64-{1}.exe" -f $buildName,$versionName;
$silentArgs = '/S';
$validExitCodes = @(0);

Install-ChocolateyPackage -packageName $packageName -fileType $installerType -silentArgs $silentArgs -url $url -url64bit $url64bit -validExitCodes $validExitCodes;
