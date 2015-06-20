$version = "5.1.1";
$buildName = "2046fc06d4d8";
$packageName = 'unity';
$installerType = 'exe';
$url = "http://netstorage.unity3d.com/unity/$buildName/Windows32EditorInstaller/UnitySetup32-5.1.1f1.exe";
$url64bit = "http://netstorage.unity3d.com/unity/$buildName/Windows64EditorInstaller/UnitySetup64-5.1.1f1.exe";
$silentArgs = '/S';
$validExitCodes = @(0);

Install-ChocolateyPackage -packageName $packageName -fileType $installerType -silentArgs $silentArgs -url $url -url64bit $url64bit -validExitCodes $validExitCodes;
