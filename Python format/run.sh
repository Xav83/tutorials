#!/bin/bash

echo $APPVEYOR_BUILD_WORKER_IMAGE

echo "Select python"
if [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Visual Studio 2022" ] || [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Visual Studio 2019" ]; then
    export PATH="C:\Python311:C:\Python311\Scripts:C:\Users\appveyor\AppData\Roaming\Python\Python311-32\Scripts:$PATH"
    export PYTHON_EXE=python
    export PIP_EXE=pip
elif [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Visual Studio 2017" ] || [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Visual Studio 2015" ]; then
    export PATH="C:\Python38:C:\Python38\Scripts:C:\Users\appveyor\AppData\Roaming\Python\Python38\Scripts:$PATH"
    export PYTHON_EXE=python3
    export PIP_EXE=pip
elif [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Visual Studio 2013" ]; then
    echo "black requires at least Visual Studio 2015"
    exit 0
elif [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Ubuntu" ] || [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Ubuntu1604" ] || [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Ubuntu2004" ]; then
    source $HOME/venv3.10.12/bin/activate

    export PATH="/home/appveyor/.local/bin:$PATH"
    export PYTHON_EXE=python
    export PIP_EXE=pip
elif [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "macOS-Mojave" ]; then
    export PATH="/Users/appveyor/Library/Python/3.9/bin:$PATH"
    export PYTHON_EXE=python
    export PIP_EXE=pip3
else # MacOs
    export PATH="/Users/appveyor/Library/Python/3.8/bin:$PATH"
    export PYTHON_EXE=python
    export PIP_EXE=pip3
fi

echo "Updates pip"
${PYTHON_EXE} -m pip install --user --upgrade pip

echo "Installs black"
${PIP_EXE} install --user black


echo "Runs black to check if the python scripts are formatted correctly"
black  --check .
