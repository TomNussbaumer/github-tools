#!/bin/bash
cd $HOME
if [ -f .bashrc ]; then
   if [ -z "$(grep 'github-tools-includes' .bashrc)" ]; then
      echo "[INFO] copying github-tools-includes to $HOME"
      curl -s https://raw.githubusercontent.com/TomNussbaumer/github-tools/master/github-tools-includes > "$HOME/github-tools-includes"
      echo "[INFO] appending '. ./github-tools-includes' to .bashrc"
      echo ". ./github-tools-includes" >> .bashrc
   else
      echo "[WARNING] github-tools-includes already in .bashrc. Nothing done."
   fi
else
   echo "[ERROR] .bashrc not found. Nothing done."
fi
