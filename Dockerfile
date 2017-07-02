FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
ENV RUNUSER daemon

RUN apt-get update && apt-get install -y lib32gcc1 wget && \
    mkdir steamcmd && cd steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -zxvf steamcmd_linux.tar.gz && \
    apt-get clean
    
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
EXPOSE 27015 27015/udp

WORKDIR steamcmd
ENTRYPOINT [./steamcmd.sh +login anonymous +force_install_dir /l4d2 +app_update 222860 validate +quit]
CMD ./srcds_run -game left4dead2 +sv_steamgroup 29436146 +sv_steamgroup_exclusive 1
