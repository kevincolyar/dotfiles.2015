#! /usr/bin/env zsh

if [ ! -d ${ZDOTDIR:-$HOME}/.zprezto ]
then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
  echo "${ZDOTDIR:-$HOME}/.zprezto exists"
fi
