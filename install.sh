#!/bin/sh

echo "Setting up Mac..."

mkdir -p "$HOME/.config"

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists)
rm -rf $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
# brew tap homebrew/cask-fonts
brew bundle --file ./Brewfile

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

echo "Setup configs via stow"
cd $HOME/.dotfiles || exit 1
stow stow
stow zsh
stow aws
stow docker
stow git
stow gnupg
stow iterm2
# stow lazygit
stow ssh
#stow tmux
#stow vim
stow vscode
ln -sf "$HOME/.vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"


echo "Setting up iTerm2 preferences..."

if [ -d "/Applications/iTerm.app" ]; then
  # Specify the preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.config/iterm2_settings"

  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

  # Tell iTerm2 to save preferences automatically
  defaults write com.googlecode.iterm2.plist "NoSyncNeverRemindPrefsChangesLostForFile_selection" -int 2
fi

# echo "Installing tmux plugins manager..."
# clone_or_pull https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
