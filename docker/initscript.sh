#!/usr/bin/env bash

# must be run as python_user
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

git clone git://github.com/yyuu/pyenv.git .pyenv
git clone git://github.com/yyuu/pyenv-virtualenv.git .pyenv/plugins/pyenv-virtualenv
pyenv install -s 3.5.2
pyenv global 3.5.2
pyenv rehash

python -m pip install --upgrade pip
pip install -U pipenv

cat << "EOF" > /tmp/pyenv_env
if [ ! -v PYENV_ROOT ]; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi
if [ ! -v LANG ]; then
  export LANGUAGE=en
  export LANG=en_US.UTF-8
fi
EOF

cat /tmp/pyenv_env >> $HOME/.bashrc
cat /tmp/pyenv_env >> $HOME/.profile
