FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
ENV RUNUSER daemon

RUN apt-get update && apt-get install -y lib32gcc1 wget && \
    mkdir steamcmd && cd steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -zxvf steamcmd_linux.tar.gz && \
    apt-get clean
    
COPY server.cfg /l4d2/left4dead2/cfg/server.cfg
WORKDIR steamcmd

ENTRYPOINT [/get_game.sh]
ENTRYPOINT [./steamcmd.sh +login anonymous +force_install_dir /l4d2 +app_update 222860 validate +quit]
CMD ["./srcds_run", "-game left4dead2","+exec config.cfg"]
