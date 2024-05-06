# vgnshiyer's dotfiles

## 1. Devices

**Primary**
Device: Macbook Air
OS: MacOS(Sonama)
Ram: 8gb
Chip: Apple M1

**Secondary**
Device: Ipad 9
OS: IpadOS 17
Tool: WorkingCopy

## 2. Getting started

### 2.1 Shell setup

1. Install Apple's CLI tools
```bash
xcode-select --install
```

2. Clone repo into a new directory
```bash
git clone https://github.com/vgnshiyer/.dotfiles ~/.dotfiles
```

3. Create symlinks in the home dirctory
```bash
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```

4. Install Homebrew, and software listed in brewfile
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# Install software from Brewfile
brew bundle --file ~/.dotfiles/Brewfile
```

5. Configure git
```bash
# Set your global Git username and email
git config --global user.name "YOUR_NAME"
git config --global user.email your@email

# Set Git to use the OSX keychain as the credential helper [Credentials will be stored] (`store` option will be stored as plaintext)
git config --global credentials.helper osxkeychain
```

### 2.2 MacOS system settings

Have this clutter-free look to mac os

1. Hide dock
2. Configure keyboard shortcuts
```txt
keyboard shortcutes --> Mission Control
  1. ⌥ Option + 1 : switch to window 1
  2. ⌥ Option + 2 : switch to window 2
  3. ⌥ Option + 3 : switch to window 3
```