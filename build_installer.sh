#!/bin/bash

if [ -f ../holotable/latest.zip ]; then
  echo
  echo "Updating holotable CDF files to latest"
  echo
  cd holotable
  pwd
  unzip -o ../../holotable/latest.zip
  cd ../
  pwd
fi

echo
echo "Updating Cards to latest"
echo
./update_cards.py

if [ -f dewit.exe ]; then
  echo
  echo "Removing stale installer"
  echo
  rm dewit.exe
fi

#if [ -d Plugins ]; then
#  echo
#  echo "Copying plugins"
#  echo
#  sudo rsync -av Plugins/ /usr/share/nsis/Plugins/
#fi

echo
echo "Building NSIS installer"
echo
makensis install.nsi

echo
echo "done."
echo



