fish_add_path ~/.cargo/bin
alias v /usr/sbin/nvim

#fish
alias c='clear'
alias up='sudo pacman -Syu'
alias rem='sudo pacman -Rns'

#git
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push'
alias unpush='git reset --soft HEAD~1; and git push --force origin main'

#go
alias gr='go run'

#neofetch
alias nf='neofetch'

#hypr
alias hypr='v ~/.config/hypr/hyprland.lua'

# Force XDG Desktop Portal to start for Vesktop screensharing
if not pgrep -f xdg-desktop-portal >/dev/null
    /usr/lib/xdg-desktop-portal &>/dev/null &
    disown
end
zoxide init fish | source
