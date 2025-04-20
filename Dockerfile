FROM ubuntu:20.04

RUN apt-get update

# install dependency
RUN apt-get install -y software-properties-common
RUN add-apt-repository multiverse
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y lib32gcc-s1 

# install steamcmd from ubuntu repository
RUN echo steamcmd steam/question select "I AGREE" | debconf-set-selections
RUN apt-get install -y steamcmd

# install tools to install mods and edit config files
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y vim

# add steam user
RUN useradd -m steam
WORKDIR /home/steam

# setup volume target
RUN mkdir /home/steam/srcds
RUN chown steam /home/steam/srcds

# bootstrap steamcmd
USER steam
RUN /usr/games/steamcmd +quit
