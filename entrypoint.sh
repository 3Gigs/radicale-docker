#!/usr//bin/env bash

set_id() {
    if [ -n $RAD_UID ]; then
        usermod -u "$RAD_UID"
    elif [ -n $RAD_GID ]; then
        groupmod -g "$RAD_GID"
    fi
}

set_id

python3 -m radicale

