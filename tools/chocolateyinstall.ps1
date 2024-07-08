
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/picguard/picguard/releases/download/v1.0.0%2B298/picguard_1.0.0+298_windows_x86_64.exe'
$url64      = 'https://github.com/picguard/picguard/releases/download/v1.0.0%2B298/picguard_1.0.0+298_windows_x86_64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'picguard*'

  checksum      = '470A73C3EFF80C820F33D5FDE83D31449D83E677398CE130C7094BDE95E11491'
  checksumType  = 'sha256'
  checksum64    = '470A73C3EFF80C820F33D5FDE83D31449D83E677398CE130C7094BDE95E11491'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
