Kevin Colyar's Dot Files
------------------------

These are config files to set up a system the way I like it.


Installation
============

    git clone git://github.com/kevincolyar/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install


Environment
===========

I am running on Mac OS X, but it will likely work on Linux as well with 
minor fiddling. I primarily use zsh, but this includes some older bash 
files as well. If you would like to switch to zsh, you can do so with 
the following command.

    chsh -s /bin/zsh


Development
===========

Merge in latest oh-my-zsh submodule

    cd oh-my-zsh
    git remote add robbyrussell https://github.com/robbyrussell/oh-my-zsh
    git merge robbyrussell/master
