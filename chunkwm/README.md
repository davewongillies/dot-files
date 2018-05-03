# chunkwm configs

## Overview

[chunkwm](https://github.com/koekeishiya/chunkwm) is a tiling window manager for
macOS. The configuration in here was taken from [this](http://hde-advent-2017.hatenadiary.jp/entry/2017/12/24/000000)
blogpost.

The configuration is set to be similar to [i3wm](https://i3wm.org) keybindings
and also features focus follows mouse.

## Installation

1. `$ stow -t ~ $PWD`
1. `$ brew tap crisidev/homebrew-chunkwm`
1. `$ brew install --HEAD --with-tmp-logging chunkwm`
1. `$ brew install --HEAD --with-logging  koekeishiya/formulae/skhd`
1. `$ brew services start chunkwm`
1. `$ brew services start skhd`

## Keybindings

| Keybinding | Description |
| ---------- | ----------- |
| alt + f    | toggle fullscreen |
| alt + shift + space | toggle float |
| alt + e | bsp layout |
| alt + s | monocle/window stack layout |
| alt + shift + q | kill focused window |
| alt + h | focus west |
| alt + j | focus south |
| alt + k | focus north |
| alt + l | focus east |
| alt + p | focus prev |
| alt + n | focus next |
| alt + shift + h | move focused window west |
| alt + shift + j | move focused window south |
| alt + shift + k | move focused window north |
| alt + shift + l | move focused window east |
| alt + r | rotate windows |
| alt + shift + p | send to previous desktop |
| alt + shift + n | send to next desktop |
| alt + shift + 1 | send to desktop 1 |
| alt + shift + 2 | send to desktop 2 |
