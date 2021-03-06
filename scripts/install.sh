#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# Start in home directory
cd ~

dir=.dotfiles                    # dotfiles directory
olddir=.dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="bin gemrc irbrc aprc vimrc gvimrc vim zshrc zprofile zshmarks oh-my-zsh gitignore_global gitconfig tmux.conf zsh rspec chef caprc pentadactylrc siegerc rbenv-gemsets gdbinit jshintrc"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
# echo "Changing to the $dir directory"
# cd $dir
# echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv .$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file .$file
done
