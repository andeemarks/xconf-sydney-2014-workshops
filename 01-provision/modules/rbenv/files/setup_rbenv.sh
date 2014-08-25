#!/bin/sh -e

RBENV_ROOT=/opt/rbenv/rbenv
RUBY_BUILD=${RBENV_ROOT}/plugins/ruby-build

mkdir -p ${RBENV_ROOT}

git clone https://github.com/sstephenson/rbenv.git ${RBENV_ROOT}
chgrp -R rbenv ${RBENV_ROOT}
chmod -R g+rwxXs ${RBENV_ROOT}

git clone https://github.com/sstephenson/ruby-build.git ${RUBY_BUILD}
chgrp -R rbenv ${RUBY_BUILD}
chmod -R g+rwxs ${RUBY_BUILD}

echo "export RBENV_ROOT=${RBENV_ROOT}" > /etc/profile.d/rbenv.sh
echo "export PATH=${RBENV_ROOT}/bin:$PATH" >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

mkdir -p ${RBENV_ROOT}/shims
mkdir -p ${RBENV_ROOT}/versions

chmod 755 ${RBENV_ROOT}/shims ${RBENV_ROOT}/versions
