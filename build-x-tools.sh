#!/usr/bin/env bash

ct_ng_package="${1:-crosstool-ng-1.24.0}"
for config in /x-tools-build/ct-ng-actions/configs/${ct_ng_package}/*.config; do
    cp $config .config
    ./ct-ng clean
    ./ct-ng build
    if [[ $? != 0 ]]; then
        echo "build $config failed!"
        break
    fi
done

# to be compatible with default target path
if [[ -d $HOME/x-tools ]]; then
    mv -f $HOME/x-tools/* /opt/x-tools
fi

exit 0
