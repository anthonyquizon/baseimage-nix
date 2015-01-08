FROM phusion/baseimage

#TODO ADD shared folder
#TODO ADD workspace

ENV HOME /root
RUN mkdir /build
ADD . /build
RUN /build/install.sh
CMD ["/sbin/my_init"]
EXPOSE 80 443

