FROM ubuntu:latest
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt install -y git build-essential cmake automake libtool autoconf
RUN apt install -y checkinstall
RUN apt install -y wget