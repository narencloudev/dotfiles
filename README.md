✅ A `setup.sh` script to install your dotfiles via Stow
✅ A `backup.sh` script to back up existing configs before symlinking

---

### 📁 Suggested `.dotfiles` Structure:

```
~/.dotfiles
├── nvim/
│   └── .config/nvim/             # Neovim config
├── tmux/
│   └── .config/tmux/             # Tmux config
├── zsh/
│   └── .zshrc                    # Zsh config
├── wezterm/
│   └── .config/wezterm/          # WezTerm config
├── starship/
│   └── .config/starship.toml     # Starship prompt
├── setup.sh                      # Dotfiles install script
├── backup.sh                     # Backup existing config
└── README.md                     # Documentation
```

---

### ✅ `README.md`

````md
# 🔧 My Dotfiles Setup

This repository contains my personal terminal and development environment config, powered by GNU Stow for easy management and portability.

## 🔍 Included Configs

- [x] Neovim (LazyVim-based)
- [x] Tmux (with custom plugins)
- [x] Zsh (.zshrc, plugins)
- [x] WezTerm (terminal emulator)
- [x] Starship (prompt)

## 🚀 Installation

```bash
git clone git@github.com:narencloudev/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./backup.sh   # Optional: backup current config
./setup.sh    # Installs via GNU Stow
````

## 📦 Requirements

* `stow`
* `git`
* Terminal tools: `nvim`, `zsh`, `wezterm`, `tmux`, `starship`, Nerd Font

Install them with:

```bash
sudo apt install stow git zsh tmux neovim
```

Manually install:

* [WezTerm](https://wezfurlong.org/wezterm/)
* [Starship](https://starship.rs/)
* [Nerd Fonts](https://www.nerdfonts.com/)

## 🧪 Test

```bash
nvim --version
zsh --version
wezterm --version
tmux -V
starship --version
```

## 🗂 Directory Layout

```
~/.dotfiles
  ├── nvim/.config/nvim
  ├── tmux/.config/tmux
  ├── zsh/.zshrc
  ├── wezterm/.config/wezterm
  ├── starship/.config/starship.toml
```

## 📤 Push to GitHub

```bash
cd ~/.dotfiles
git add .
git commit -m "Update dotfiles"
git push origin main
```

---

````

---

### ✅ `setup.sh`

```bash
#!/usr/bin/env bash

set -e

echo "🔧 Installing dotfiles using GNU Stow..."
cd "$(dirname "$0")"

stow zsh
stow nvim
stow tmux
stow wezterm
stow starship

echo "✅ Dotfiles installed!"
````

Make it executable:

```bash
chmod +x setup.sh
```

---

### ✅ `backup.sh`

```bash
#!/usr/bin/env bash

BACKUP_DIR="$HOME/.backup/dotfiles_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "🗂 Backing up existing configs to: $BACKUP_DIR"

cp -r "$HOME/.config/nvim" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$HOME/.config/tmux" "$BACKUP_DIR/" 2>/dev/null || true
cp "$HOME/.zshrc" "$BACKUP_DIR/" 2>/dev/null || true
cp -r "$HOME/.config/wezterm" "$BACKUP_DIR/" 2>/dev/null || true
cp "$HOME/.config/starship.toml" "$BACKUP_DIR/" 2>/dev/null || true

echo "✅ Backup complete."
```

Make it executable:

```bash
chmod +x backup.sh
```

---

Would you like me to generate and upload these files for you now as a `.zip` or copy them into a new GitHub-ready repo layout?
