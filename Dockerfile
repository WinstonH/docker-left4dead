FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
ENV RUNUSER daemon

COPY get_game.sh /get_game.sh
RUN apt-get update && apt-get install -y lib32gcc1 wget && \
    mkdir steamcmd && cd steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -zxvf steamcmd_linux.tar.gz && \
    apt-get clean && chmod +x /get_game.sh

EXPOSE 27015 27015/udp
ENTRYPOINT [/get_game.sh]
