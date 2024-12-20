#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
download_url="https://dl.google.com/go/go1.23.4.linux-amd64.tar.gz"
go_tar_gz_path="$root_path/go.tar.gz"
while true; do
    if [[ -e "$go_tar_gz_path" ]]; then
        rm -rf "$go_tar_gz_path"
    fi
    curl -C - -o "$go_tar_gz_path" "$download_url"
    if [ $? -eq 0 ]; then
        break
    fi
done
