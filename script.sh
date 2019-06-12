#!/bin/#!/usr/bin/env bash

GIT_HASH=$(echo $(git rev-parse HEAD))
GIT_COMMENT=$(git show -s --format=%B $GIT_HASH)
CURRENT_TIME=$(date +"[%m/%d/%Y %H:%M:%S]")

printf "%-20s %-15s %-45s %s\n" "$CURRENT_TIME" $USER $GIT_HASH "$GIT_COMMENT" >> sample_log2.txt
