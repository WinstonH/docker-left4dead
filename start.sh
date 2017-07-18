#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "104.115.209.150 store.steampowered.com" >> /etc/hosts
echo "104.115.209.150 steamcommunity.com" >> /etc/hosts
cd /steamcmd
./steamcmd.sh +login anonymous +force_install_dir /l4d2 +app_update 222860 validate +quit
cd /l4d2/left4dead2
./srcds_run -game left4dead2 +sv_steamgroup 29436146 +sv_steamgroup_exclusive 1
