FROM phusion/baseimage

ADD ./build /build
RUN /build/user.sh

USER dev
WORKDIR /home/dev

ENV USER dev
ENV HOME /home/dev

RUN /build/nix.sh
