#!/bin/bash

GHTFILE="github-tools-includes"
GHTHOMEFILE="$HOME/$GHTFILE"
GHTLOCALFILE=

## check if we want to install locally
[ "$(pwd)" != "$HOME" ] && [ -f $GHTFILE ] && GHTLOCALFILE="$(pwd)/$GHTFILE"

cd "$HOME"
if [ -f .bashrc ]; then
   if [ -z "$(grep $GHTFILE .bashrc)" ]; then
      echo "[INFO] appending \". ./$GHTFILE\" to .bashrc"
      echo ". \"\$HOME/$GHTFILE\"" >> .bashrc
   fi
   if [ -z "$GHTLOCALFILE" ]; then
     echo "[INFO] fetching from url to [$GHTHOMEFILE]"
     curl -s https://raw.githubusercontent.com/TomNussbaumer/github-tools/master/github-tools-includes > "$GHTHOMEFILE"
   else
     echo "[INFO] local copy from [$GHTLOCALFILE] to [$GHTHOMEFILE]"
     cp "$GHTLOCALFILE" "$GHTHOMEFILE"
   fi
   
   echo "[INFO] To use the github tools in the current shell please execute the"
   echo "[INFO] following line to refresh the environment settings:"
   echo
   echo "source \"\$HOME/$GHTFILE\""
   echo
else
   echo "[ERROR] .bashrc not found. Nothing done."
fi
