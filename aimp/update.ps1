$releases = "http://www.aimp.ru/?do=download&os=windows";

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases;
     $html = $download_page.ParsedHtml;

     $c = $html.getElementsByTagName('div') |?{$_.className -eq 'card_content'} | select -First 1;
     $c.outerHTML -match 'AIMP v(?<version>(\d.)*), build (?<build>\d*)\S';
     $version = "$($Matches.version).$($Matches.build)";
     
     $a = $html.getElementsByTagName('a') |?{$_.innerText -eq "AIMP.RU"} | select -First 1;
     $url  = $a.href;

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
