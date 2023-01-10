#!/usr/bin/env bash

## installs various meta software
## typically used once per new machine, however safe to be called multiple times

source ./lib.sh

if xcode-select -p 1>/dev/null; then
  already_installed "Command line tools"
else
  xcode-select --install
fi

## https://docs.brew.sh/Installation
if has_exec brew; then
  already_installed "Homebrew"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


## Oh-my-zsh at default location
## https://github.com/robbyrussell/oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  already_installed "Oh My Zsh!"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


## Version Managers - for languages/platforms like JVM, Node, Ruby, Python etc.
## Currently I need only JVM (Java, Groovy, Kotlin, Scala) related multiple versions
## we can add tools like RVM, NVM, GVM etc here.

#install RVM (Optional as it goes wrong many times)

#brew install gpg
#curl -sSL https://rvm.io/mpapis.asc | gpg --import -
#curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
#
#echo 409B6B1796C275462A1703113804BB82D39DC0E3:6: | gpg --import-ownertrust
#echo 7D2BAF1CF37B13E2069D6956105BD0E739499BDB:6: | gpg --import-ownertrust
#
#\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
#
#source ${HOME}/.rvm/scripts/rvm


#Install NVM
mkdir ~/.nvm
brew install nvm

NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

NVM_DIR >> ~/.zshrc
