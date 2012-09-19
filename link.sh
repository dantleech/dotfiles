#!/bin/bash

for file in $(cat dotfiles.list); do
    TARGET=$HOME"/"$file
    SOURCE=$HOME"/dotfiles/dotfiles/"$file
    cd $HOME
    echo `pwd`

    if [ -h $TARGET ]; then
        rm $TARGET
    fi

    if [ -e $TARGET ] && [ ! -h $TARGET ]; then
        echo " -- "$TARGET" is not a symlink -- skipping!!!"
    else
        echo " -- Symlinking "$SOURCE" to "$TARGET
        ln -s $SOURCE $file
    fi
done
