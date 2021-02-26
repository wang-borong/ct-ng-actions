#!/usr/bin/env bash

ct_ng_package="${1:-crosstool-ng-1.24.0}"
for config in /x-tools-build/ct-ng-actions/configs/${ct_ng_package}/*.config; do
    cp $config .config
    ./ct-ng clean
    ./ct-ng build
done

# to be compatible with default target path
[ -d $HOME/x-tools ] && mv $HOME/x-tools/* /opt/x-tools
