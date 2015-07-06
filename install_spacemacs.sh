#! /usr/bin/env bash

if [ ! -d $HOME/.emacs.d ]
then
  git clone --recursive http://github.com/syl20bnr/spacemacs $HOME/.emacs.d
else
  echo "$HOME/.emacs.d exists"
fi
