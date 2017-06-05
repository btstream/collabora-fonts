#!/bin/bash
# fc-cache -fv

if [[ -e /opt/ssl/certs/ca ]]; then
    export DONT_GEN_SSL_CERT=true
fi

if [[ -e /opt/collaboraoffice5.3/share/fonts/custom  ]]; then
    rm -rf /opt/collaboraoffice5.3/share/fonts/custom
fi

cp -r /usr/share/fonts/Custom /opt/collaboraoffice5.3/share/fonts/custom
bash /start-libreoffice.sh
