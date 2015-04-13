$version = "5.0.1";
$buildName = "5a2e8fe35a68";
$packageName = 'unity';
$installerType = 'exe';
$url = "http://netstorage.unity3d.com/unity/$buildName/Windows32EditorInstaller/UnitySetup32.exe";
$url64bit = "http://netstorage.unity3d.com/unity/$buildName/Windows64EditorInstaller/UnitySetup64.exe";
$silentArgs = '/S';
$validExitCodes = @(0);

Install-ChocolateyPackage -packageName $packageName -fileType $installerType -silentArgs $silentArgs -url $url -url64bit $url64bit -validExitCodes $validExitCodes;
