#!/bin/bash

cd /webssh

exec python3 app.py \
    --xsrf=False \
    --xheaders=False \
    --origin='*' \
    --debug \
    --delay=10
