#!/bin/bash
cd $HOME
if [ -f .bashrc ]; then
   if [ -z "$(grep 'github-tools-includes' .bashrc)" ]; then
      echo "[INFO] appending '. ./github-tools-includes' to .bashrc"
      echo ". ./github-tools-includes" >> .bashrc
   fi
   curl -s https://raw.githubusercontent.com/TomNussbaumer/github-tools/master/github-tools-includes > "$HOME/github-tools-includes"
   echo "[INFO] sourcing .bashrc again."
   . .bashrc
else
   echo "[ERROR] .bashrc not found. Nothing done."
fi
