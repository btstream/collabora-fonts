#!/bin/bash
# fc-cache -fv

export DONT_GEN_SSL_CERT=true

if [[ ! -e /opt/ssl/certs/ca ]]; then
    mkdir -p /opt/ssl/
    cd /opt/ssl/
    mkdir -p certs/ca
    openssl genrsa -out certs/ca/root.key.pem 2048
    openssl req -x509 -new -nodes -key certs/ca/root.key.pem -days 9131 -out certs/ca/root.crt.pem -subj "/C=DE/ST=BW/L=Stuttgart/O=Dummy Authority/CN=Dummy Authority"
    mkdir -p certs/{servers,tmp}
    mkdir -p "certs/servers/localhost"
    openssl genrsa -out "certs/servers/localhost/privkey.pem" 2048 -key "certs/servers/localhost/privkey.pem"
    openssl req -key "certs/servers/localhost/privkey.pem" -new -sha256 -out "certs/tmp/localhost.csr.pem" -subj "/C=DE/ST=BW/L=Stuttgart/O=Dummy Authority/CN=localhost"
    openssl x509 -req -in certs/tmp/localhost.csr.pem -CA certs/ca/root.crt.pem -CAkey certs/ca/root.key.pem -CAcreateserial -out certs/servers/localhost/cert.pem -days 9131
    cp certs/servers/localhost/privkey.pem /etc/loolwsd/key.pem
    cp certs/servers/localhost/cert.pem /etc/loolwsd/cert.pem
    cp certs/ca/root.crt.pem /etc/loolwsd/ca-chain.cert.pem
fi

if [[ ! -e /etc/loolwsd/key.pem ]]; then
    cp certs/servers/localhost/privkey.pem /etc/loolwsd/key.pem
    cp certs/servers/localhost/cert.pem /etc/loolwsd/cert.pem
    cp certs/ca/root.crt.pem /etc/loolwsd/ca-chain.cert.pem
fi

if [[ -e /opt/collaboraoffice5.3/share/fonts/custom  ]]; then
    rm -rf /opt/collaboraoffice5.3/share/fonts/custom
fi

cp -r /usr/share/fonts/Custom /opt/collaboraoffice5.3/share/fonts/custom
bash /start-libreoffice.sh
