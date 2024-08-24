Import-Module Chocolatey-AU

function global:au_GetLatest {
    $LatestRelease = Invoke-RestMethod -UseBasicParsing -Uri "https://api.github.com/repos/picguard/picguard/releases/latest"
    $LatestVersion = $LatestRelease.tag_name.Replace('v', '').Replace('+', '.')
    $LatestURL64 = ($LatestRelease.assets | Where-Object {$_.name.EndsWith("_windows_x64.exe")}).browser_download_url

    if (!$LatestURL64) {
        throw "64bit URL is missing!"
    }

    Write-Output "newversion=$($LatestVersion)" >> $Env:GITHUB_OUTPUT

    @{
        URL64        = $LatestURL64
        Version      = $LatestVersion
        ReleaseNotes = $LatestRelease.html_url
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*(\$)url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }

#        "picguard.nuspec" = @{
#            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
#        }
    }
}

update -ChecksumFor 64
