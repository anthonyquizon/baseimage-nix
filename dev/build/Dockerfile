FROM phusion/baseimage

ENV HOME /root
RUN mkdir /build
ADD . /build
RUN /build/install.sh
CMD ["/sbin/my_init"]
EXPOSE 80 443

