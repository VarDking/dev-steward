#!/bin/bash

PWD=$(pwd)
TMP_DIR="/tmp"
PACKAGE_DIR="$PWD/packages"
REDIS_RELEASES_URL="http://download.redis.io/releases/"

DEV_PRFIX=${DEV_PRFIX-"/usr/opt/dep_env"}

usage(){
    cat <<-EOF
    Install you develop soft one key. Switch soft versions in a easy way. 
    Inspired by nvm.

    surport    : none. We are developing.

    in planning: redis,nginx,node,mysql,mongodb,
                  shadowsocks,git,svn,tmux,vim

    Cοommands:
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

install_redis(){
    local port=6379
    local redis_path=${DEV_PRFIX}/redis    
  
    local version=$1
    if [ -n version ];then
        version=$(latest_redis_version)
    fi
    
    echo "downloading redis ${version} ......"

    echo "redis installing ......"
}

show_versions(){
    for version in $@
    do
        printf "\033[36m $version \033[0m\n"
    done
}

redis_versions()
{
    local versions=$(curl $REDIS_RELEASES_URL 2> /dev/null \
          | egrep "</a>" \
          | egrep -o "redis-([0-9\w\.])+\.tar.gz" \
          | egrep -o "([0-9]+\.)+[0-9]+" \
          | sort -u -k 1,1n -k 2,2n -k 3,3n -t . \
          )
    echo $versions
}

show_redis_versions()
{
    show_versions $(redis_versions)
}

latest_redis_version()
{
    local version=$(redis_versions) 
    echo ${#version[*]}
}

