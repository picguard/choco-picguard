# choco-picguard

[![Publish](https://github.com/picguard/choco-picguard/actions/workflows/publish.yml/badge.svg)](https://github.com/picguard/choco-picguard/actions/workflows/publish.yml)
[![Chocolatey Version](https://img.shields.io/chocolatey/v/picguard)](https://community.chocolatey.org/packages/picguard)

[Quick start guide](https://docs.chocolatey.org/en-us/create/create-packages-quick-start/#quick-start-guide)

```powershell
# Run as administrator
choco install picguard --version="1.0.0-rc398" --prerelease --source .
```

```powershell
choco apikey --api-key [API_KEY_HERE] -source https://push.chocolatey.org/

choco push picguard.1.0.0-rc398.nupkg --source https://push.chocolatey.org/
```
