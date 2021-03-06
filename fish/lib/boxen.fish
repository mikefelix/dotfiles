#!/usr/bin/env fish

# Make the root of Boxen available.

set -x BOXEN_HOME /opt/boxen

# Add homebrew'd stuff to the path.

set -x PATH $BOXEN_HOME/homebrew/bin $BOXEN_HOME/homebrew/sbin $PATH

# Add homebrew'd stuff to the manpath.

set -x MANPATH $BOXEN_HOME/homebrew/share/man $MANPATH

# Add any binaries specific to Boxen to the path.

set -x PATH $BOXEN_HOME/bin $PATH

# Add ./bin to the path. This happens after initialization to make
# sure local stubs take precedence over stuff like rbenv.

set -x PATH bin $PATH

# Boxen is active.

set -x BOXEN_SETUP_VERSION (env GIT_DIR=$BOXEN_HOME/repo/.git git rev-parse --short HEAD)
set -x CFLAGS "-I$BOXEN_HOME/homebrew/include"

# Expose basic setup paths. BOXEN_HOME is already exported at the top level.

set -x BOXEN_BIN_DIR /opt/boxen/bin
set -x BOXEN_CONFIG_DIR /opt/boxen/config
set -x BOXEN_DATA_DIR /opt/boxen/data
set -x BOXEN_ENV_DIR /opt/boxen/env.d
set -x BOXEN_LOG_DIR /opt/boxen/log
set -x BOXEN_SOCKET_DIR /opt/boxen/data/project-sockets
set -x BOXEN_SRC_DIR /Users/christopherlobay/src
set -x BOXEN_ELASTICSEARCH_PORT 19200
set -x BOXEN_ELASTICSEARCH_URL "http://localhost (BOXEN_ELASTICSEARCH_PORT)/"

# Expose GitHub credentials

set -x BOXEN_GITHUB_LOGIN christopherlobay
set -x HOMEBREW_CACHE $BOXEN_HOME/cache/homebrew

# Make all the fancy `hub` shortcuts available via `git`.

set -x LDFLAGS "-L$BOXEN_HOME/homebrew/lib"
set -x BOXEN_MEMCACHED_PORT 21211
set -x BOXEN_MEMCACHED_URL "memcached://localhost $BOXEN_MEMCACHED_PORT/"
set -x BOXEN_MYSQL_PORT 13306
set -x BOXEN_MYSQL_SOCKET /opt/boxen/data/mysql/socket
set -x BOXEN_MYSQL_URL "mysql://christopherlobay@localhost:13306/"

# Configure and activate rbenv. You know, for rubies.

set -x RBENV_ROOT $BOXEN_HOME/rbenv

set -x PATH $BOXEN_HOME/rbenv/bin $BOXEN_HOME/rbenv/plugins/ruby-build/bin $PATH

# Let the env know where Redis runs.

set -x BOXEN_REDIS_PORT 16379
set -x BOXEN_REDIS_URL "redis://localhost $BOXEN_REDIS_PORT/"
set -x RUBY_GC_MALLOC_LIMIT 1000000000
set -x RUBY_FREE_MIN 500000
set -x RUBY_HEAP_MIN_SLOTS 40000
set -x PATH /opt/boxen/rbenv/shims /opt/boxen/rbenv/bin $PATH
rbenv rehash 2>/dev/null
function git ; hub $argv ; end