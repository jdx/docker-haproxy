FROM dickeyxxx/base
MAINTAINER Jeff Dickey jeff@dickeyxxx.com

RUN apt-get -y install haproxy

ADD haproxy.cfg /haproxy/haproxy.cfg

CMD ["haproxy", "-db", "-f", "/haproxy/haproxy.cfg"]

EXPOSE 80
