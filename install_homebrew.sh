#!/bin/bash

progs_common="macvim zsh tmux readline most brew-cask dos2unix terminal-notifier ack htop markdown tree the_silver_searcher html2text sshuttle"
progs_dev="git kitematic ctags mysql rabbitmq node unixodbc leiningen rlwrap"
progs_docker="docker boot2docker docker-compose"
progs_db="freetds --with-unixodbc"
progs_sec="encfs nmap netcat autossh"
apps="rdio cord firefox google-chrome gitx iterm2 virtualbox vlc sshfs ynab dropbox cyberduck bittorrent-sync daisydisk keepassx airfoil superduper wiretap-studio key-codes flash telegram"
licensed_apps="default-folder-x cocktail postbox"
progs_ruby="rbenv ruby-build rbenv-gemset rbenv-gem-rehash rbenv-bundler"
quicklook_progs="qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package"

brew update && \
brew doctor && \
brew install $progs_common && \
brew install $progs_dev && \
brew install $progs_docker && \
brew install $progs_sec && \
brew install $progs_ruby

# Cask
brew install cask
brew cask install $apps
brew cask install $licensed_apps
brew cask install $quicklook_progs

# R
brew cask install xquartz
brew tap homebrew/science
brew install r

# Neovim
brew tap neovim/homebrew-neovim
brew install --HEAD neovim
