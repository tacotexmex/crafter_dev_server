#!/bin/sh

cd /home/deploy/.minetest/games/crafter
git reset HEAD --hard
git clean -fd
git pull origin master
#git submodule sync
#git submodule update --init --recursive
systemctl --user restart minetest@crafter
