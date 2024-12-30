# starship
Invoke-Expression (&starship init powershell)

# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# carapace
$env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
carapace _carapace | Out-String | Invoke-Expression

# aliae
aliae init pwsh | Invoke-Expression

# first download online help files
if (!(Test-Path "~/.local/share/powershell/Help")){
    Update-Help
}

# parameter color
Set-PSReadLineOption -Colors @{ "parameter"="darkgreen" }
