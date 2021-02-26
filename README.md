# mloberg dotfiles

> These are my dotfiles. There are many like it, but this one is mine.

This is how I like my system. You have different tastes and preferences, so
cloning this outright probably isn't what you want. Take and tweak from here to
fit your needs.

## install

    git clone https://github.com/mloberg/dotfiles.git ~/.dotfiles
    ~/.dotfiles/script/mac

## one-line install (not recommended)

    bash <(curl -fsS https://raw.githubusercontent.com/mloberg/dotfiles/master/script/mac)

## updating

    dotfiles

## other things

* [yubikey](https://github.com/drduh/YubiKey-Guide)

## thanks

inspiration/dotfiles taken from:

* [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)
* [Zach Holman dotfiles](https://github.com/holman/dotfiles)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Jess Frazelle's dotfiles](https://github.com/jessfraz/dotfiles)

## common problems

### zsh compinit: insecure directories

See insecure directories with `compaudit`. Fix them with:

    compaudit | xargs chmod g-w

### yubikey stops working

Try restarting the gpg-agent. If that doesn't work, restart.

    gpgconf --kill gpg-agent
