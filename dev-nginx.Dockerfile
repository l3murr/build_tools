FROM nginx:1.27.4
ARG APP_URL
ARG SAN
RUN echo $SAN
RUN SAN=$(echo "${SAN}") && printf "\n[SAN]\nsubjectAltName=${SAN}" >> /etc/ssl/openssl.cnf
RUN SAN=$(echo "${SAN}") && echo "subjectAltName=${SAN}" >> /extfile
RUN openssl genrsa -aes256 --passout pass:timeless -out /etc/ssl/private/wai-ca.key 4096
RUN APP_URL=$(echo "${APP_URL}") && openssl req --passin pass:timeless -new -key /etc/ssl/private/wai-ca.key -x509 -out /etc/ssl/certs/wai-ca.crt -days 3650 -subj "/C=DE/ST=Hamburg/L=Hamburg/O=Top/OU=Cheese/CN=${APP_URL}" -reqexts SAN -config "/etc/ssl/openssl.cnf"
RUN  APP_URL=$(echo "${APP_URL}") && openssl req -new -nodes -newkey rsa:4096 -keyout /etc/ssl/private/wai.key -out /etc/ssl/certs/wai.req -batch -subj "/C=DE/ST=Hamburg/L=Hamburg/O=Top/OU=Cheese/CN=${APP_URL}" -reqexts SAN -config "/etc/ssl/openssl.cnf"
RUN openssl x509 --passin pass:timeless -req -in /etc/ssl/certs/wai.req -CA /etc/ssl/certs/wai-ca.crt -CAkey /etc/ssl/private/wai-ca.key -CAcreateserial -out /etc/ssl/certs/wai.crt -days 3650 -sha256 -extfile "/extfile"
RUN cat /etc/ssl/private/wai.key > /etc/ssl/certs/wai-chain.crt
RUN cat /etc/ssl/certs/wai.crt >> /etc/ssl/certs/wai-chain.crt
RUN cat /etc/ssl/certs/wai-ca.crt >> /etc/ssl/certs/wai-chain.crt
RUN echo 'server {\n\
    listen              443 ssl;\n\
    ssl_certificate     /etc/ssl/certs/wai.crt;\n\
    ssl_certificate_key /etc/ssl/private/wai.key;\n\
    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;\n\
    ssl_ciphers         HIGH:!aNULL:!MD5;\n\
\n\
    location /cert.crt {\n\
        alias /etc/ssl/certs/wai-ca.crt;\n\
    }\n\
\n\
    location /api/context {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_http_version 1.1;\n\
        proxy_set_header Upgrade $http_upgrade;\n\
        proxy_set_header Connection "upgrade";\n\
        proxy_set_header Host $host;\n\
        proxy_pass http://websocket-1.default.svc.cluster.local:9000/connection/websocket;\n\
    }\n\
\n\
    location /@vite {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
\n\
    location /@id {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
\n\
    location /resources {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
\n\
    location /node_modules {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
        \n\
    location / {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-1.default.svc.cluster.local;\n\
        proxy_set_header Host $host;\n\
    }\n\
}\n\
\n\
server {\n\
    listen              5173 ssl;\n\
    ssl_certificate     /etc/ssl/certs/wai.crt;\n\
    ssl_certificate_key /etc/ssl/private/wai.key;\n\
    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;\n\
    ssl_ciphers         HIGH:!aNULL:!MD5;\n\
        \n\
    location / {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_http_version 1.1;\n\
        proxy_set_header Upgrade $http_upgrade;\n\
        proxy_set_header Connection "upgrade";\n\
        proxy_pass http://server-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
}\n\
\n\
server {\n\
    listen              8080 ssl;\n\
    ssl_certificate     /etc/ssl/certs/wai.crt;\n\
    ssl_certificate_key /etc/ssl/private/wai.key;\n\
    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;\n\
    ssl_ciphers         HIGH:!aNULL:!MD5;\n\
        \n\
    location / {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_http_version 1.1;\n\
        proxy_set_header Upgrade $http_upgrade;\n\
        proxy_set_header Connection "upgrade";\n\
        proxy_pass http://server-1.default.svc.cluster.local:8080;\n\
        proxy_set_header Host $host;\n\
    }\n\
}\n\
' >> /etc/nginx/conf.d/default.conf
