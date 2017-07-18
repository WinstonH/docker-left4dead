FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
ENV RUNUSER daemon

COPY start.sh /start.sh
RUN apt-get update && apt-get install -y lib32gcc1 wget && \
    mkdir steamcmd && cd steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -zxvf steamcmd_linux.tar.gz && \
    apt-get clean && \
    chmod +x /start.sh
    
EXPOSE 27015 27015/udp

WORKDIR steamcmd
ENTRYPOINT ["/start.sh"]
