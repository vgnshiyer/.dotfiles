# vgnshiyer's dotfiles

<img width="1470" alt="Screenshot 2024-06-17 at 8 33 20 AM" src="https://github.com/vgnshiyer/.dotfiles/assets/39982819/369252ee-1af6-491e-b6e3-fafc05fb1c6d">
<img width="1470" alt="Screenshot 2024-06-20 at 4 14 36 PM" src="https://github.com/vgnshiyer/.dotfiles/assets/39982819/5fc2d4b3-4920-4117-8ee1-54d4edebb84f">
<img width="1470" alt="Screenshot 2024-06-20 at 5 34 14 PM" src="https://github.com/vgnshiyer/.dotfiles/assets/39982819/0ed9a5e2-10cb-4ef2-9405-2e74eb90e5bc">


## 1. Devices

**Primary**

Device: Macbook Air

OS: MacOS(Sonama)

Ram: 8gb

Chip: Apple M1

Tools:
 - Arc Browser
 - AdBlock
 - Vimium (operate links with keyboard)
 - Maccy (clipboard manager)

**Secondary**
Device: Ipad 9
OS: IpadOS 17
Tools: 
 - WorkingCopy

## 2. Dev workflow

### 2.1 Shell

1. Install Apple's CLI tools
```
bash xcode-select --install
```

2. Clone repo into a new directory
```bash
git clone https://github.com/vgnshiyer/.dotfiles ~/.dotfiles
```

3. Install Homebrew, and software listed in brewfile
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# Install software from Brewfile
brew bundle --file ~/.dotfiles/Brewfile
```

4. Configure git
```bash
# Set your global Git username and email
git config --global user.name "YOUR_NAME"
git config --global user.email your@email

# Set Git to use the OSX keychain as the credential helper [Credentials will be stored] (`store` option will be stored as plaintext)
git config --global credentials.helper osxkeychain
```

5. Track changes with stow
```bash
stow .
```

### 2.2 Terminal

1. Install fish cli
```bash
# install fish
brew install fish

# add fish to shells
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells

# change default shell
chsh -s /opt/homebrew/bin/fish

# Update fish config
stow . --force
```

2. Install alacritty
```bash
brew install --cask alacritty

# add fonts
brew tap epk/epk

# install sf-mono-nerd-font
brew install --cask font-sf-mono-nerd-font

# install starship
brew install startship
```

3. Install tmux
```bash
# Install tmux
brew install tmux
```

### 2.3 MacOS system settings

Have this clutter-free look to mac os

1. Automatically Hide dock & menu bar
2. Configure keyboard shortcuts
```txt
keyboard shortcutes --> Mission Control
  1. ⌥ Option + 1 : switch to window 1
  2. ⌥ Option + 2 : switch to window 2
  3. ⌥ Option + 3 : switch to window 3
```

### 2.4 Window manager

1. Install yabai
```bash
# Install yabai: https://github.com/koekeishiya/yabai
brew install koekeishiya/formulae/yabai

# Install skhd
brew install koekeishiya/formulae/skhd

# Start services
skhd --start-service
yabai --start-service
```

### 2.5 Code Editor

1. Link vscode settings
```bash
# remove existing files
rm ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/keybindings.json

# link settings
ln -s /Users/vgnshiyer/.dotfiles/vscode_settings/settings.json /Users/vgnshiyer/Library/Application\ Support/Code/User/settings.json
ln -s /Users/vgnshiyer/.dotfiles/vscode_settings/keybindings.json /Users/vgnshiyer/Library/Application\ Support/Code/User/keybindings.json
```

2. I use vim also. Replicate my vim setup with my `.vimrc` file. Install vim-plug as the plugin manager for vim.
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

3. Open `.vimrc` and type the command `:PlugInstall`.

4. **Installing language servers:** When opening a new file, type `:LspInstallServer`. This installs the appropriate language server for the filetype.

**Note:** Do not add `.vim/` to source control. Vim-plug manages updates to plugins in the `.vim/plugged/` directory via git.

## 3 Bonus 

1. Add pokefetch to your terminal session (Display a random pokemon along with system info to your terminal)
```bash
sudo ln -s ~/.dotfiles/bin/pokefetech/pokefetch.py /usr/local/bin/pokefetch
```
2. Add them to your fish config (or zshrc) [here](https://github.com/vgnshiyer/.dotfiles/blob/main/.config/fish/config.fish).

3. **Notetaking:** I have commands `zet`, `tday` and `sb` for my notetaking workflow which is integrated with Obsidian for cross-platform access.
- `zet` --> opens a quick note with my default template.
- `tday` --> opens today's daily note.
- `sb` --> this command opens my second-brain directory which consists of all my notes. Find it [here](https://github.com/vgnshiyer/second-brain)
