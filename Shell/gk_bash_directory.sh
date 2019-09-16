#!/bin/sh

#-------
# Finder Commands
#-------

function mkcd(){
  echo "creating $@ ..."
  mkdir $@
  cd $@
}
function hh(){
  WORK_PATH="/Users/GauravKeshre/Workspace/HX/"
  echo "Opening $WORK_PATH ..."
  cd $WORK_PATH
}

function work(){
  WORK_PATH="/Users/gauravkeshre/Workspace/Microsoft/Teamspace-iOS"
  echo "Opening $WORK_PATH ..."
  cd $WORK_PATH
  ls
  git status
  find $WORK_PATH -maxdepth 1  -type d -name "*.xcworkspace" -print | xargs open -g
}

function flt(){
   if [[ $@ ]]; then
      echo "Flattening $@ ..."
      echo "Performing: find $@ -mindepth 2 -type f -exec mv -i '{}' $@ ';'"
      find $@/ -mindepth 2 -type f -exec mv -i '{}' $@/ ';'
    else
      echo "!! Please pass a path"
    fi
}