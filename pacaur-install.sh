#!/bin/bash

mkdir build-aur
cd build-aur
git clone -q https://aur.archlinux.org/cower.git
cd cower
makepkg -sri --skippgpcheck --noconfirm
cd ..
git clone -q https://aur.archlinux.org/pacaur.git
cd pacaur
makepkg -sri --noconfirm
cd ../..
rm -rf build-aur
