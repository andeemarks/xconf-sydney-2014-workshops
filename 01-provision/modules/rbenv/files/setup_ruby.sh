#!/bin/sh -e

if [ -z "${RUBY_VERSION}" ]
then
   echo "Missing RUBY_VERSION environment variable"
   exit 1
fi

export RBENV_ROOT=/opt/rbenv/rbenv
export PATH=${RBENV_ROOT}/bin:${PATH}

umask 002
rbenv install ${RUBY_VERSION}
rbenv rehash
