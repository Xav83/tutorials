#!/bin/bash

echo "Installs yamllint"
export PATH=$PATH:/home/appveyor/.local/bin:/Users/appveyor/Library/Python/2.7/bin
pip install yamllint

echo "Runs yamllint"
yamllint --strict .