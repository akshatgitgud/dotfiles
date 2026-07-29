#!/usr/bin/env bash

set -e

CONFIGS=(
  fish
  hypr
  hyprpanel
  kitty
  mako
  neofetch
  nvim
  nwg-look
  waybar
  wlogout
  swaync
  spicetify
  systemd
  tofi
  gtk-3.0
  gtk-4.0
  btop
  Thunar
  xfce4
  xsettingsd
)

for cfg in "${CONFIGS[@]}"; do
  rm -rf "$HOME/.config/$cfg"
  ln -s "$HOME/dotfiles/.config/$cfg" "$HOME/.config/$cfg"
done

rm -f ~/.config/mimeapps.list
ln -s ~/dotfiles/.config/mimeapps.list ~/.config/mimeapps.list

rm -f ~/.config/pavucontrol.ini
ln -s ~/dotfiles/.config/pavucontrol.ini ~/.config/pavucontrol.ini
