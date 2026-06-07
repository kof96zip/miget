#!/bin/bash

exec python3 app.py \
    --xsrf=False \
    --xheaders=False \
    --origin='*' \
    --debug \
    --delay=10
