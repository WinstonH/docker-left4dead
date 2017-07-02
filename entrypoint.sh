#!/bin/sh
cd /steamcmd
./steamcmd.sh +login anonymous +force_install_dir /l4d2 +app_update 222860 validate +quit
cd /l4d2/left4dead2/cfg/server.cfg
wget https://raw.githubusercontent.com/WinstonH/docker-left4dead/dev/server.cfg
cd /l4d2
./srcds_run -game left4dead2 +exec config.cfg
