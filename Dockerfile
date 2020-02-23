FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y autoremove

RUN apt-get install -y git && \
    apt-get install -y subversion && \
    apt-get install -y python && \
    apt-get install -y build-essential && \
    apt-get install -y gawk && \
    apt-get install -y unzip && \
    apt-get install -y libncurses5-dev && \
    apt-get install -y zlib1g-dev && \    
    apt-get install -y libssl-dev && \    
    apt-get install -y wget && \
    apt-get install -y time && \
    apt-get install -y ecdsautils
    
RUN git clone https://github.com/freifunk-gluon/gluon.git gluon -b v2018.2.x

WORKDIR /gluon
RUN mkdir site
RUN git clone https://git.devlol.org/xeniter/gluon-site-fflinz.git site
RUN make update

