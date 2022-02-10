#!/bin/bash

echo "Installs black"
export PATH=$PATH:/home/appveyor/.local/bin:/Users/appveyor/Library/Python/2.7/bin
pip install black

echo "Runs black to format the python scripts"
black .

echo "Checks if all the files versionned were already formatted"
git diff --exit-code
