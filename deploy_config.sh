#!/bin/bash

echo "Initializing or updating submodules (plugins)."
git submodule init && git submodule update
echo "Linking the vimrc to your HOME/.vimrc"
if [ -z "ln -s vimrc ~/.vimrc" ]
then
	echo "Linked :)."
	echo "You are ready, have fun!"
else
	echo "It seems like that a file already exists, it may be your old vimrc?"
	echo "Anyway, you may be already ready? If you want to update your plugins, just do: git submodule update"
fi
