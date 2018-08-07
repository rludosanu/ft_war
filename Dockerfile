FROM ubuntu:16.04

RUN \
	apt-get update &&\
	apt-get install -y vim gcc nasm make file gdb

RUN mkdir /War

COPY ./* /War/

CMD ["bash"]
