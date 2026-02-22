$releases = "https://www.aimp.ru/?do=download&os=windows";

function Get-RedirectedUrl {
 
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )
 
    $response = Invoke-WebRequest -Uri $URL -Method Head -MaximumRedirection 5 -UseBasicParsing;
    $finalUrl = $response.BaseResponse.ResponseUri.AbsoluteUri;
    return $finalUrl;
}

function global:au_GetLatest {
    Install-Module -Name PowerHTML -Force;

    Write-Host "1.Download page $($releases)";
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing;
    $html = ConvertFrom-Html -Content $response.Content;

    $mainButton = $html.SelectSingleNode("//a[contains(@class, 'button_download_windows')]")
    if ($mainButton -and $mainButton.OuterHtml -match 'v(?<version>[\d.]*)') {
        $version = $Matches.version
        Write-Host "2.Version: $version"
    }
    
    $container32Bit = $html.SelectNodes("//li[contains(@class, 'link')]") | ? { $_.InnerText -like "*32-bit*" } | Select-Object -First 1;
    $a32Bit = $container32Bit.SelectSingleNode(".//a[contains(@class, 'link_full')]");
    $urlRaw  = $a32Bit.Attributes["href"].Value;
    Write-Host "3.urlRaw 32bit  '$($urlRaw)'";

    $url32 = Get-RedirectedUrl -URL $urlRaw;
    Write-Host "4.url32 '$($url32)'";

    $container32Bit.outerHTML -match 'SHA256: (?<sha>\w*)<';
    $sha256  = $Matches.sha;
    Write-Host "5.sha256 32bit '$($sha256)'";

    $container64Bit = $html.SelectNodes("//li[contains(@class, 'link')]") | ? { $_.InnerText -like "*64-bit*" } | Select-Object -First 1;
    $a64Bit = $container64Bit.SelectSingleNode(".//a[contains(@class, 'link_full')]");
    $urlRaw  = $a64Bit.Attributes["href"].Value;
    Write-Host "6.urlRaw 64bit  '$($urlRaw)'";

    $url64 = Get-RedirectedUrl -URL $urlRaw;
    Write-Host "7.url64 '$($url64)'";

    $container32Bit.outerHTML -match 'SHA256: (?<sha>\w*)<';
    $sha256_64  = $Matches.sha;
    Write-Host "8.sha256 64bit '$($sha256_64)'";

    return @{ Version = $version; URL32 = $url32; SHA256 = $sha256; URL64 = $url64; SHA256_64 = $sha256_64 }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"      
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"           
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"      
        }
    }
}

rm "*.nupkg";
update -Force;
ls *.nupkg | select -First 1 | %{ Push-Package $_.FullName; }
