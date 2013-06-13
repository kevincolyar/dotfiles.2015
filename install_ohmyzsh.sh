#! /bin/bash

cp oh-my-zsh/themes/kevincolyar.zsh-theme .
rm -rf ~/.dotfiles/oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.dotfiles/oh-my-zsh
rm -rf ~/.dotfiles/oh-my-zsh/.git
mv kevincolyar.zsh-theme oh-my-zsh/themes/kevincolyar.zsh-theme 
