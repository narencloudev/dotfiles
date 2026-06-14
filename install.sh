#!/usr/bin/env bash

set -e

echo "==> Updating packages"
sudo apt update

echo "==> Installing packages"
sudo apt install -y 
git 
curl 
wget 
unzip 
zsh 
tmux 
neovim 
fzf 
zoxide 
eza 
kitty

echo "==> Installing Starship"

if ! command -v starship >/dev/null 2>&1; then
curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "==> Installing Oh My Zsh"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
RUNZSH=no CHSH=no sh -c 
"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "==> Installing zsh-autosuggestions"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
git clone 
https://github.com/zsh-users/zsh-autosuggestions 
"$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

echo "==> Installing zsh-syntax-highlighting"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
git clone 
https://github.com/zsh-users/zsh-syntax-highlighting 
"$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

echo "==> Installing TPM"

mkdir -p ~/.tmux/plugins

if [ ! -d ~/.tmux/plugins/tpm ]; then
git clone 
https://github.com/tmux-plugins/tpm 
~/.tmux/plugins/tpm
fi

echo "==> Installing Meslo Nerd Font"

mkdir -p ~/.local/share/fonts

wget -q -O /tmp/meslo.zip 
https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip

unzip -o /tmp/meslo.zip -d ~/.local/share/fonts >/dev/null

fc-cache -fv >/dev/null

# =========================
# 👉 KITTY ADDITION START
# =========================

echo "==> Installing Kitty Gruvbox theme"

mkdir -p ~/.config/kitty/themes

if [ ! -f ~/.config/kitty/themes/gruvbox_dark.conf ]; then
git clone https://github.com/dexpota/kitty-themes /tmp/kitty-themes
cp /tmp/kitty-themes/themes/gruvbox_dark.conf ~/.config/kitty/themes/
rm -rf /tmp/kitty-themes
fi

mkdir -p ~/.config/kitty

ln -sf "$REPO_DIR/.config/kitty" ~/.config/kitty

# =========================
# 👉 KITTY ADDITION END
# =========================

echo "==> Creating config folders"

mkdir -p ~/.config
mkdir -p ~/.config/wezterm

REPO_DIR="$(pwd)"

echo "==> Creating symlinks"

ln -sf "$REPO_DIR/.zshrc" ~/.zshrc

ln -sf "$REPO_DIR/.tmux.conf" ~/.tmux.conf

ln -sf "$REPO_DIR/.config/starship.toml" 
~/.config/starship.toml

ln -sf "$REPO_DIR/.config/wezterm/wezterm.lua" 
~/.config/wezterm/wezterm.lua

echo "==> Installing tmux plugins"

~/.tmux/plugins/tpm/bin/install_plugins || true

echo "==> Setting default shell"

if [ "$SHELL" != "$(which zsh)" ]; then
chsh -s "$(which zsh)"
fi

echo ""
echo "=================================="
echo "Setup Complete"
echo "Logout/Login and start WezTerm"
echo "=================================="
