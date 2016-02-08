#!/bin/bash

# Setup Prezto
sudo apt-get install -y git zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

shopt -s extglob
for rcfile in $HOME/.zprezto/runcoms/!(README.md); do
  ln -s "$rcfile" "$HOME/.$(basename $rcfile)"
done

# Set zsh as new shell
sudo usermod -s /bin/zsh "$(whoami)"

# Install Vim Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Append Pathogen Loader Line onto vimrc (if vimrc is located in /etc/vim)
sudo bash -c  "echo 'execute pathogen#infect()' >> /etc/vim/vimrc"

# Installing vim-neatstatus
cd ~/.vim/bundle
git clone git://github.com/maciakl/vim-neatstatus.git

# Creating plugin folder and adding Most Recently Used(MRU) Plugin by Yegappan Lakshmanan
mkdir ~/.vim/plugin  
cd ~/.vim/plugin  
wget https://raw.githubusercontent.com/vim-scripts/mru.vim/master/plugin/mru.vim

