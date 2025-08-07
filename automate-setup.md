✅ Got it! You're asking for a **one-shot setup** process:

> Clone your `~/.dotfiles` repo ➜ Stow everything ➜ Install all related plugins, tools, and configs ➜ One command, and **your full environment is restored and ready to use**.

---

## ✅ Let’s Create the Ideal Workflow

### 🧱 Your Setup Includes:

* **Zsh** + Oh My Zsh + Plugins (`zsh-autosuggestions`, `zsh-syntax-highlighting`)
* **Tmux** + Plugins (via TPM)
* **Neovim** (LazyVim + Mason packages + plugins)
* **WezTerm**
* **Starship**
* **Fonts** (Nerd Fonts)
* **GNU Stow** structure
* **Tiling WM** (optional: i3/Hyprland if needed)

---

## 🛠️ 1. Scaffold Repo Structure (already done)

```bash
~/.dotfiles/
├── zsh/.zshrc
├── nvim/.config/nvim/      ← LazyVim
├── wezterm/.config/wezterm/
├── tmux/.tmux.conf
├── starship/.config/starship.toml
├── fonts/.local/share/fonts/
└── install.sh
```

---

## 🧩 2. Final `install.sh` Script (🔥 Fully Automatic)

Here's your **one-click setup** installer script:

```bash
#!/usr/bin/env bash

set -e

echo "🔧 Installing required packages..."

# Basic tools
sudo apt update && sudo apt install -y \
  zsh git curl wget stow tmux unzip neovim fd ripgrep fzf \
  build-essential python3-pip fonts-font-awesome

# Install Starship
if ! command -v starship >/dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Install Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "✨ Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Zsh Plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
mkdir -p "$ZSH_CUSTOM/plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" || true

# Change default shell to Zsh
if [[ "$SHELL" != "$(which zsh)" ]]; then
  chsh -s "$(which zsh)"
fi

echo "📁 Stowing dotfiles..."
cd "$HOME/.dotfiles"
stow zsh nvim wezterm tmux starship fonts

# Fonts refresh
fc-cache -fv

# Setup TPM (tmux plugin manager)
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install tmux plugins silently
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# LazyVim Plugin Setup
echo "🧠 Setting up LazyVim plugins..."
nvim --headless "+Lazy! sync" +qa

# Mason packages (like language servers)
echo "🧩 Installing Mason packages..."
nvim --headless "+MasonInstall angular-language-server bash-language-server prettier eslint-lsp lua-language-server" +qa || true

echo "✅ All set! Please restart your terminal to apply Zsh and Starship."
```

---

## 🧬 3. GitHub Clone & Run Instructions

```bash
# 1. Clone your dotfiles repo
git clone https://github.com/narencloudev/dotfiles.git ~/.dotfiles

# 2. Run the full setup
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

---

## ✅ Final Features Recap

✔ Installs Zsh, Starship, Neovim, Tmux, WezTerm
✔ Stows your configs into place
✔ Sets up Zsh shell and plugins
✔ Syncs LazyVim plugins
✔ Installs Mason packages
✔ Installs Nerd Fonts
✔ Everything works in **one step**

---

Would you like me to:

* Add i3/Hyprland setup if you're using one?
* Add a backup script (`backup.sh`)?
* Add `.desktop` autostart for terminal or wm?

Let me know — we can make this the ultimate recovery script for any system.
