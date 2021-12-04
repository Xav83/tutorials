#!/bin/bash

xcodes=`find /Applications -maxdepth 1 -type d -name 'Xcode*.app'`
for xcode in $xcodes
do
    echo "Selecting $xcode"
    sudo xcode-select -s $xcode
    sudo xcode-select -p
done