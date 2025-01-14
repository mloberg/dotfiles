# dotfiles

My collection of dotfiles and setup scripts.

## install

    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply mloberg

## updating

    chezmoi update

## other setup

* [yubikey](https://github.com/drduh/YubiKey-Guide)

## thanks

inspiration/dotfiles taken from:

* [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)
* [Zach Holman dotfiles](https://github.com/holman/dotfiles)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Jess Frazelle's dotfiles](https://github.com/jessfraz/dotfiles)

## common problems

### yubikey stops working

Try restarting the gpg-agent (`gpgkill`). If that doesn't work, restart.
