# vgnshiyer's dotfiles

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

**Secondary**
Device: Ipad 9
OS: IpadOS 17
Tools: 
 - WorkingCopy

## 2. Dev workflow

### 2.1 Shell

1. Install Apple's CLI tools
```bash
xcode-select --install
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