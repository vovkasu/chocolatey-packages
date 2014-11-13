$packageName = 'bmfont'
$installerType = 'exe' 
$url = 'http://www.angelcode.com/products/bmfont/install_bmfont_1.13.exe'
$silentArgs = '/S'
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
