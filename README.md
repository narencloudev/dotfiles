# Dotfiles

Personal Linux development environment setup.

## Included

* Zsh
* Oh My Zsh
* Starship
* Tmux
* TPM (Tmux Plugin Manager)
* WezTerm
* Neovim
* MesloLGS Nerd Font
* zoxide
* fzf
* eza
* zsh-autosuggestions
* zsh-syntax-highlighting

---

## Repository Structure

```text
.
├── .config
│   ├── starship.toml
│   └── wezterm
│       └── wezterm.lua
├── .tmux.conf
├── .zshrc
├── install.sh
└── README.md
```

---

## Fresh Ubuntu Setup

Install Git:

```bash
sudo apt update
sudo apt install git -y
```

Clone repository:

```bash
git clone git@github.com:narencloudev/dotfiles.git
cd dotfiles
```

Make installer executable:

```bash
chmod +x install.sh
```

Run installer:

```bash
./install.sh
```

Reboot:

```bash
reboot
```

---

## What install.sh Does

* Updates package lists
* Installs:

  * git
  * curl
  * wget
  * unzip
  * zsh
  * tmux
  * neovim
  * fzf
  * zoxide
  * eza
* Installs Starship
* Installs Oh My Zsh
* Installs:

  * zsh-autosuggestions
  * zsh-syntax-highlighting
* Installs TPM
* Downloads and installs MesloLGS Nerd Font
* Creates required config directories
* Creates symlinks
* Sets Zsh as default shell
* Installs tmux plugins

---

## Updating Configurations

Edit files directly inside the repository:

```bash
cd ~/dotfiles
code .
```

Commit and push changes:

```bash
git add .
git commit -m "update configs"
git push
```

---

## Verify Symlinks

```bash
ls -l ~/.zshrc
ls -l ~/.tmux.conf
ls -l ~/.config/starship.toml
ls -l ~/.config/wezterm/wezterm.lua
```

Expected output:

```text
.zshrc -> ~/dotfiles/.zshrc
.tmux.conf -> ~/dotfiles/.tmux.conf
starship.toml -> ~/dotfiles/.config/starship.toml
wezterm.lua -> ~/dotfiles/.config/wezterm/wezterm.lua
```

---

## Tmux Plugins

Installed automatically through TPM:

* tmux-sensible
* vim-tmux-navigator
* tmux-resurrect
* tmux-continuum
* tmux-yank
* tmux-sessionx
* tmux-fzf
* tmux-online-status
* tmux-battery

Manual installation if needed:

```bash
~/.tmux/plugins/tpm/bin/install_plugins
```

---

## Notes

All active configuration files are symlinked to this repository.

Changes made inside the repository immediately affect the running environment after reloading the corresponding application.
