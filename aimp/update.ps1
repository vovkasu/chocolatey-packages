$releases = "https://www.aimp.ru/?do=download&os=windows";

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
     $download_page = Invoke-WebRequest -Uri $releases;
     $html = $download_page.ParsedHtml;

     $c = $html.getElementsByTagName('div') |?{$_.className -eq 'card_content'} | select -First 1;
     $c.outerHTML -match 'AIMP v(?<version>(\d.)*), build (?<build>\d*)\S';
     $version = "$($Matches.version).$($Matches.build)";
     
     $a = $c.getElementsByTagName('a') |?{$_.innerText -like "AIMP*"} | select -First 1;
     $urlRaw  = $a.href;
     $url = Get-RedirectedUrl -URL $urlRaw;
     #$url = "https://www.aimp.ru/?do=download.file&id=5"

     $c.outerHTML -match 'SHA256: (?<sha>\w*)<';
     $sha256  = $Matches.sha;

     return @{ Version = $version; URL32 = $url; SHA256 = $sha256 }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.SHA256)'"      
        }
    }
}

rm "*.nupkg";
update;
ls *.nupkg | select -First 1 | %{ cpush $_.FullName; }
