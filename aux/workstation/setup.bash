#!/usr/bin/bash

# depends on "lnif" function (which depends on explicit $HOME paths); 
# see separate bash repo
source $BASH_CUSTOM_FUNCTIONS_FILE

CURRENT_DIR=$(pwd)

NET_BASE='/z/750/dot/repos/networking/configs/workstation/generic'

#···············································································
#   SETUP HOSTS FILE AND NGINX
#···············································································

lnif "$NET_BASE/hosts/hosts_active.ini"     '/etc/hosts'
lnif "$NET_BASE/nginx/linked_dir"           '/etc/nginx'

sudo nginx -t
sudo systemctl restart nginx

#···············································································
cd $CURRENT_DIR
