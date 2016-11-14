#!/bin/bash

# written by Mr.chen.

set -e

. bin/common.sh
. bin/redis.sh

VERSION="0.1.0"

#detect root
require_root_permission

usage(){
    cat <<-EOF
    Install you develop soft one key. Switch soft versions in a easy way. 
    Inspired by nvm.

    surport    : none. We are developing.

    in planning: redis,nginx,node,mysql,mongodb,
                 shadowsocks,git,svn,tmux,vim,gm

    Cοmmands:
    ds install [soft]                   install soft
    ds install -c config [soft]         install soft through config file
    ds ls [soft]                        list all soft installed
    ds rm [soft]                        remove soft installed by dev_steward

    ds restart [soft]                   restart soft 
    ds activate [soft]                  activate one soft you installed. soft will activated by default after you installed.

    Options:
    -v, --version                       show dev_steward version
    -h, --help                          show help
EOF
}

# show ds version
ds_version(){
    log_info $VERSION
}
