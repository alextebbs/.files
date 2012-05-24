#!/bin/bash

echo "Symlinking your new awesome dotfiles config"
echo "This assumes your '.files' directory is in your home directory"
echo

files=( .vimrc .vim .bashrc .bash_aliases .gitconfig .gitignore )

for i in "${files[@]}"
do
    printf "Symlinking ~/.files/%s to ~/%s\n" $i $i
    ln -s ~/.files/$i ~/$i
    echo
done
