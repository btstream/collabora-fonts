FROM collabora/code
MAINTAINER btstream <btstream@hotmail.com>

# Environments vars
ENV TERM=xterm

RUN mkdir /usr/share/fonts/Custom
# && /bin/bash -c "apt-get -y update && apt-get -y install xmlstarlet && xmlstarlet ed --inplace -u \"/config/ssl/enable\" -v false /etc/loolwsd/loolwsd.xml && xmlstarlet ed --inplace -u \"/config/ssl/termination\" -v false /etc/loolwsd/loolwsd.xml"

VOLUME "/usr/share/fonts/Custom"

ADD starup.sh /

CMD bash starup.sh
