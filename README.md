# vgnshiyer's dotfiles

### Configuration

Device: Macbook Air
Ram: 8gb
Chip: Apple M1

### Getting started

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