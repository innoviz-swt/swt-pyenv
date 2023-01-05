#!/bin/bash
cd $(dirname $0)

base="${1:-focal}" 
ver="${2:-latest}" 
docker run --rm -it swt-pyenv-$base:$ver $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22} 