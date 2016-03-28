#!/bin/env zsh

local TARGET="${ZDOTDIR:-$HOME}"
local RUNCOMS="$TARGET"/.zprezto/runcoms

ln -s "$RUNCOMS"/zshrc "$TARGET"/.zshrc
ln -s "$RUNCOMS"/zshenv "$TARGET"/.zshenv
ln -s "$RUNCOMS"/zprofile "$TARGET"/.zprofile
ln -s "$RUNCOMS"/zlogin "$TARGET"/.zlogin
ln -s "$RUNCOMS"/zlogout "$TARGET"/.zlogout
ln -s "$RUNCOMS"/zpreztorc "$TARGET"/.zpreztorc

