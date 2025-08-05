FROM nginx:1.27.4
RUN echo '-----BEGIN PRIVATE KEY-----\n
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgm/SCKdieJcEOk7Ju\n
7W6/n7CzOLY08LCb6V6Om1Fsz+GhRANCAASG5g65dPfnVZHjpgmowSVf8Kkiwhjs\n
TTQrvUhZCp+45WSRIAulWIKSzg9a4qZULA12EvSFBJFaYZhN7dCP2dLF\n
-----END PRIVATE KEY-----' >> /etc/ssl/private/wai.key
RUN echo '-----BEGIN CERTIFICATE-----\n
MIIDijCCAw+gAwIBAgISBrZ0JIdUTzB4RT0Gem/ZX61RMAoGCCqGSM49BAMDMDIx\n
CzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQswCQYDVQQDEwJF\n
NjAeFw0yNTA4MDUxNzA5MDlaFw0yNTExMDMxNzA5MDhaMBMxETAPBgNVBAMTCHRt\n
bnAubmV0MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhuYOuXT351WR46YJqMEl\n
X/CpIsIY7E00K71IWQqfuOVkkSALpViCks4PWuKmVCwNdhL0hQSRWmGYTe3Qj9nS\n
xaOCAiIwggIeMA4GA1UdDwEB/wQEAwIHgDAdBgNVHSUEFjAUBggrBgEFBQcDAQYI\n
KwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUnouIdUg8MIRa4QXmV3CF\n
XSVbPI8wHwYDVR0jBBgwFoAUkydGmAOpUWiOmNbEQkjbI79YlNIwMgYIKwYBBQUH\n
AQEEJjAkMCIGCCsGAQUFBzAChhZodHRwOi8vZTYuaS5sZW5jci5vcmcvMB8GA1Ud\n
EQQYMBaCCioudG1ucC5uZXSCCHRtbnAubmV0MBMGA1UdIAQMMAowCAYGZ4EMAQIB\n
MC0GA1UdHwQmMCQwIqAgoB6GHGh0dHA6Ly9lNi5jLmxlbmNyLm9yZy84Mi5jcmww\n
ggEEBgorBgEEAdZ5AgQCBIH1BIHyAPAAdgAN4fIwK9MNwUBiEgnqVS78R3R8sdfp\n
MO8OQh60fk6qNAAAAZh7aubWAAAEAwBHMEUCIQDAaVBG+QXMf0pgn/xeoBG5f8eS\n
0O+tKiWrr7nAS/nOxQIgTaqbX78n1L/HWZKUSqIAqxLXAFSn1NjC+ILck7UmviwA\n
dgDd3Mo0ldfhFgXnlTL6x5/4PRxQ39sAOhQSdgosrLvIKgAAAZh7aucXAAAEAwBH\n
MEUCIQDhrpj6wJ0DtfGgWpu64cklgZ8mnfx4TlmGzc3bV+X2qgIgCdz5K90h8y3L\n
vY7Ezb57SC3mZFk1OT858uWNmcEVxC4wCgYIKoZIzj0EAwMDaQAwZgIxAPHOE3wK\n
MNTt7qYoMTEsN/a3UBpjgoCNh+SrD77rpqsUHrohX92oAueNgf2/yRUStgIxANLu\n
UAPS7PsD/+W9OgRC1HjbsWz05VYiTXOYpQqTrmJKtsTyCNUjwhpKf18xAOiuYQ==\n
-----END CERTIFICATE-----\n
-----BEGIN CERTIFICATE-----\n
MIIEVzCCAj+gAwIBAgIRALBXPpFzlydw27SHyzpFKzgwDQYJKoZIhvcNAQELBQAw\n
TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh\n
cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMjQwMzEzMDAwMDAw\n
WhcNMjcwMzEyMjM1OTU5WjAyMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNTGV0J3Mg\n
RW5jcnlwdDELMAkGA1UEAxMCRTYwdjAQBgcqhkjOPQIBBgUrgQQAIgNiAATZ8Z5G\n
h/ghcWCoJuuj+rnq2h25EqfUJtlRFLFhfHWWvyILOR/VvtEKRqotPEoJhC6+QJVV\n
6RlAN2Z17TJOdwRJ+HB7wxjnzvdxEP6sdNgA1O1tHHMWMxCcOrLqbGL0vbijgfgw\n
gfUwDgYDVR0PAQH/BAQDAgGGMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcD\n
ATASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBSTJ0aYA6lRaI6Y1sRCSNsj\n
v1iU0jAfBgNVHSMEGDAWgBR5tFnme7bl5AFzgAiIyBpY9umbbjAyBggrBgEFBQcB\n
AQQmMCQwIgYIKwYBBQUHMAKGFmh0dHA6Ly94MS5pLmxlbmNyLm9yZy8wEwYDVR0g\n
BAwwCjAIBgZngQwBAgEwJwYDVR0fBCAwHjAcoBqgGIYWaHR0cDovL3gxLmMubGVu\n
Y3Iub3JnLzANBgkqhkiG9w0BAQsFAAOCAgEAfYt7SiA1sgWGCIpunk46r4AExIRc\n
MxkKgUhNlrrv1B21hOaXN/5miE+LOTbrcmU/M9yvC6MVY730GNFoL8IhJ8j8vrOL\n
pMY22OP6baS1k9YMrtDTlwJHoGby04ThTUeBDksS9RiuHvicZqBedQdIF65pZuhp\n
eDcGBcLiYasQr/EO5gxxtLyTmgsHSOVSBcFOn9lgv7LECPq9i7mfH3mpxgrRKSxH\n
pOoZ0KXMcB+hHuvlklHntvcI0mMMQ0mhYj6qtMFStkF1RpCG3IPdIwpVCQqu8GV7\n
s8ubknRzs+3C/Bm19RFOoiPpDkwvyNfvmQ14XkyqqKK5oZ8zhD32kFRQkxa8uZSu\n
h4aTImFxknu39waBxIRXE4jKxlAmQc4QjFZoq1KmQqQg0J/1JF8RlFvJas1VcjLv\n
YlvUB2t6npO6oQjB3l+PNf0DpQH7iUx3Wz5AjQCi6L25FjyE06q6BZ/QlmtYdl/8\n
ZYao4SRqPEs/6cAiF+Qf5zg2UkaWtDphl1LKMuTNLotvsX99HP69V2faNyegodQ0\n
LyTApr/vT01YPE46vNsDLgK+4cL6TrzC/a4WcmF5SRJ938zrv/duJHLXQIku5v0+\n
EwOy59Hdm0PT/Er/84dDV0CSjdR/2XuZM3kpysSKLgD1cKiDA+IRguODCxfO9cyY\n
Ig46v9mFmBvyH04=\n
-----END CERTIFICATE-----' >> /etc/ssl/certs/wai.crt
RUN echo 'server {\n\
    listen              8443 ssl;\n\
    ssl_certificate     /etc/ssl/certs/wai.crt;\n\
    ssl_certificate_key /etc/ssl/private/wai.key;\n\
    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;\n\
    ssl_ciphers         HIGH:!aNULL:!MD5;\n\
\n\
    location /api/context {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_http_version 1.1;\n\
        proxy_set_header Upgrade $http_upgrade;\n\
        proxy_set_header Connection "upgrade";\n\
        proxy_set_header Host $host;\n\
        proxy_pass http://websocket-service-1.default.svc.cluster.local:8000/connection/websocket;\n\
    }\n\
\n\
    location /@vite {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-service-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
\n\
    location /@id {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-service-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
\n\
    location /resources {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-service-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
\n\
    location /node_modules {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-service-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
        \n\
    location / {\n\
        resolver kube-dns.kube-system.svc.cluster.local;\n\
        proxy_pass http://server-service-1.default.svc.cluster.local;\n\
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
        proxy_pass http://server-service-1.default.svc.cluster.local:5173;\n\
        proxy_set_header Host $host;\n\
    }\n\
}\n\
\n\
server {\n\
    listen              8083 ssl;\n\
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
        proxy_set_header X-Forwarded-Host $http_host;\n\
        proxy_pass http://server-service-1.default.svc.cluster.local:8080;\n\
        proxy_set_header Host $host;\n\
    }\n\
}\n\
\n\
server {\n\
    listen              6443 ssl;\n\
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
        proxy_pass http://server-service-1.default.svc.cluster.local:6420;\n\
        proxy_set_header Host $host;\n\
    }\n\
}\n\
' >> /etc/nginx/conf.d/default.conf
