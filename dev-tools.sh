#!/usr/bin/env bash

source ./lib.sh

set +e

## upgrade the tools that come with system
brew install zsh bash git make ruby curl

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

source ~/.zshrc
