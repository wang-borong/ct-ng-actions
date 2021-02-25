#!/usr/bin/env bash

for config in /x-tools-build/ct-ng-actions/configs/*.config; do
    cp $config .config
    ct-ng build
done
