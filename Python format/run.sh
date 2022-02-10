#!/bin/bash

echo "Installs black"
export PATH=$PATH:/home/appveyor/.local/bin:/Users/appveyor/Library/Python/2.7/bin
pip3 install black

echo "Runs black to check if the python scripts are formatted correctly"
black  --check .
