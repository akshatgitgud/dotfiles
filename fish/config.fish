# Force XDG Desktop Portal to start for Vesktop screensharing
if not pgrep -f xdg-desktop-portal >/dev/null
    /usr/lib/xdg-desktop-portal &>/dev/null &
    disown
end
zoxide init fish | source
