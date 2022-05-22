$latestReleaseUrl = "https://github.com/java-decompiler/jd-gui/releases/latest";

function Get-RedirectedUrl {
 
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )
 
    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect=$false
    $response=$request.GetResponse()
 
    If ($response.StatusCode -eq "Found")
    {
        $response.GetResponseHeader("Location")
    }
}

function global:au_GetLatest {
     $latestReleaseRedirectedUrl = Get-RedirectedUrl $latestReleaseUrl;

     $download_page = Invoke-WebRequest -Uri $latestReleaseRedirectedUrl;
     $html = $download_page.ParsedHtml;

     $a = $html.getElementsByTagName('a') |?{$_.textContent -match 'jd-gui-windows-(?<version>[\d.]+).zip'}|select -First 1;
     $version = $Matches.version;

     $uriBuilder = New-Object -TypeName System.UriBuilder -ArgumentList $latestReleaseRedirectedUrl;
     $uriBuilder.Path = $a.pathname;
     $urlZipFile = $uriBuilder.ToString();

     return @{ Version = $version; URL32 = $urlZipFile}
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]version\s*=\s*)('.*')"      = "`$1'$($Latest.Version)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum32Type\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
        "tools\chocolateyUninstall.ps1" = @{
            "(^[$]version\s*=\s*)('.*')"      = "`$1'$($Latest.Version)'"
        }
    }
}

rm "*.nupkg";
update;
ls *.nupkg | select -First 1 | %{ cpush $_.FullName; }