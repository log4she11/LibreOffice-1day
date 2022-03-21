#!/bin/bash

apt-get install lxc -y
apparmor_parser -r -W ./docker-nfs-server/apparmor.conf
cd docker-nfs-server && docker-compose up -d