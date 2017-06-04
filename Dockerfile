FROM collabora/code
MAINTAINER btstream <btstream@hotmail.com>

# Environments vars
ENV TERM=xterm

RUN mkdir /usr/share/fonts/Custom

VOLUME /usr/share/fonts/Custom

ADD starup.sh /

CMD bash starup.sh
