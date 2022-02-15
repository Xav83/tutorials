#!/bin/bash

echo $APPVEYOR_BUILD_WORKER_IMAGE
if [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Visual Studio 2015" ] || [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Visual Studio 2013" ]; then
    choco install python3
    export PATH=:C:\\Python310\\Scripts:$PATH

    echo "Installs black"
    pip3 install black
elif [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Ubuntu" ] || [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Ubuntu1604" ] || [ "$APPVEYOR_BUILD_WORKER_IMAGE" = "Ubuntu2004" ]; then
    export PATH=/home/appveyor/venv3.6.15/bin:$PATH
    echo "Installs black"
    pip install black
else
    pip3 install black
fi


echo "Runs black to check if the python scripts are formatted correctly"
black  --check .
