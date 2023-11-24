#!/bin/bash

# "awk"
pip list --outdate | awk 'NR > 2 {print $1}' > outdate-packages.txt
pip install --upgrade -r outdate-packages.txt

# "jq"
pip list --outdate --format=json | jq '.[].name' | tr -d '"' > outdate-packages.txt
pip install --upgrade -r outdate-packages.txt
