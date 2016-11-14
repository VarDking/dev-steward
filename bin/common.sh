#!/bin/bash

# written by Mr.chen.

# format time
now(){
    echo `date +"%Y-%m-%d %H:%M:%S"`
}

# log info green(green is default)
log_info() {
    printf "\033[32m [$(now)] [INFO] $@ \033[0m\n"  
}

#log info cyan
log_info_cyan(){
    printf "\033[36m [$(now)] [INFO] $@ \033[0m\n"
}

#log warn
log_warn(){
    printf "\033[33m [$(now)] [WARN] $@ \033[0m\n"
}

# log error and exit
log_error() {
    printf "\033[31m [$(now)] [Error] $@ \033[0m\n"
    exit 1
}

# assure dirs exist
assure_dir(){
    for path in $@
    do
        mkdir -p $path
    done
}

# universal decompress method
decompress(){
    echo ""
}
