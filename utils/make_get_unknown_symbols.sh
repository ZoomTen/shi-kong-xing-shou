#!/usr/bin/env sh

make -j 2>&1 | sed -n "s|.\+Unknown symbol \"\(.\+\)\"|\1|p" | sort | uniq
