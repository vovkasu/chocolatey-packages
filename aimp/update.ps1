$releases = "http://www.aimp.ru/?do=download";

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases;
     
     $url     = $download_page.links | ? {$_.innerText -like "AIMP.RU"} | select -First 1 -expand href;

     $urlEnd = $url -split "storage/" | select -Last 1;
     $splitResult = $urlEnd -split "/aimp_";
     $MD5 = $splitResult[0];
     $version = $splitResult[1].Trim(".exe");
     return @{ Version = $version; URL32 = $url; MD5 = $MD5 }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.MD5)'"      
        }
    }
}

rm "*.nupkg";
update;
ls *.nupkg | select -First 1 | %{ cpush $_.FullName; }
