#!/usr/bin/env bash
export PYTHONPATH=""
export PYTHONPATH="$(dirname "$(readlink -f "$0")")/laygo2":$PYTHONPATH
PYTHON_PATH="$(which python)"
exec $PYTHON_PATH $@
