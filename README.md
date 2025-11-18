# dotfiles

My collection of dotfiles and setup scripts.

## install

    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ivorisoutdoors

## updating

    chezmoi update

## other setup

* [yubikey](https://github.com/drduh/YubiKey-Guide)

### browser extensions

* [1Password](https://addons.mozilla.org/en-US/firefox/addon/1password-x-password-manager/)
* [ClearURLs](https://addons.mozilla.org/en-US/firefox/addon/clearurls/)
* [Decentraleyes](https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/)
* [Disconnect](https://addons.mozilla.org/en-US/firefox/addon/disconnect/)
* [Kagi Search for Firefox](https://addons.mozilla.org/en-US/firefox/addon/kagi-search-for-firefox/)
* [Privacy Badger](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/)

## thanks

inspiration/dotfiles taken from:

* [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)
* [Zach Holman dotfiles](https://github.com/holman/dotfiles)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Jess Frazelle's dotfiles](https://github.com/jessfraz/dotfiles)

## common problems

### yubikey stops working

Try restarting the gpg-agent (`gpgkill`). If that doesn't work, restart.
