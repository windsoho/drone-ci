#!/usr/bin/env bash

# this needs to be run as python_user, not root
# USAGE: api_runtests.sh <source_code_dir>

set -e

export DEBUG=true

REST_API_PATH=$1
cd $REST_API_PATH

pipenv lock -r >requirements.txt
pip install -q -r requirements.txt

py.test -q tests
