#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

while IFS= read -r path; do
    newpath=$(echo "$path" | sed 's/\(\.sops\)/ /g')
    notpath=${path//\\\(\.sops\\\)/ /g}

    echo "1: $path = $newpath"
    #echo "2: $path = $notpath" 
done < <(grep -oP '^\s*- path_regex:\s*\K.*' "../.sops.yaml")
