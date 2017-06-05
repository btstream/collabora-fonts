#!/bin/bash
# fc-cache -fv

if [[ -e /opt/collaboraoffice5.3/share/fonts/custom  ]]; then
    rm -rf /opt/collaboraoffice5.3/share/fonts/custom
fi

ln -s /usr/share/fonts/Custom /opt/collaboraoffice5.3/share/fonts/custom

bash /start-libreoffice.sh
