#!/bin/bash

for file in $(cat dotfiles.list); do
    TARGET=$HOME"/"$file
    SOURCE="dotfiles/"$file

    if [ -h $TARGET ]; then
        rm $TARGET
    fi

    if [ -e $TARGET ] && [ ! -h $TARGET ]; then
        echo " -- "$TARGET" is not a symlink -- skipping!!!"
    else
        echo " -- Symlinking "$SOURCE" to "$TARGET
        ln -s $SOURCE $TARGET
    fi
done
