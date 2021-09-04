#!/usr/bin/env sh

make 2>&1 | sed -n "s|.\+Unknown symbol \"\(.\+\)\"|\1|p" | sort | uniq
