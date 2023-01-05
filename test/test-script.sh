#!/bin/bash

pyenv install 3.6.15 
pyenv global 3.6.15
python -m pip install numpy
python -c "import numpy as np; print(np.ones(10))" > /tmp/out/focal-3.6.15.txt 
