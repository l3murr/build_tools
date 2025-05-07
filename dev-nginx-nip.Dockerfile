FROM nginx:1.27.4
RUN echo '-----BEGIN PRIVATE KEY-----\n\
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCRAIY/IT+LiLyo\n\
FKwcROGJ+Bx7NwSmEByHmLxFkWVi8ZGKON0Feh8RxHoCvf/FRqdi1m4e0sjwmRjs\n\
9IziW6vsRwJRaMI/k9ehyqqXlmEONQdCT6EaT/OJw8852VJNUZ2UhCPV9RKoPuzj\n\
DYv6f4BR4FxtZdHvNr0DcXmo31nQLfiqe3soxvdhr7ek/BAMwOMoIctxP/mY3eoV\n\
UdJtWf42cDRhRoiuU0VDz6/hAkZpAGKncd7hdnGIPyNSkHZJxvggXH3/SCpykEgg\n\
P0qOfAzd326fA4QhKbu/6fTe8LDGusDIUOuHMdYKsKiiN1lBXUhhT2dT1RV6fJg4\n\
LjiIBu61AgMBAAECggEABfMQjwyNL+t3Wiom+a311xRgDsouHaYxlXq11uDlWQ7y\n\
WsqEfxIIrlDydKRZFz4T5iFIOWmKpxyRAj/ye+MpBbPQK4jx12v4gAHxx/B6oPua\n\
BaWAxbScGH35RbVeBCAiKBLX6ZJ5pn+WdqZ6pNeQa0uaXz67Q2ZqkPaZ+EzZwYnh\n\
h1A9CoXWAknXhzTQ4r0eCiNF71BuPuZvuGrQS4sdiP/IHR6xvuFE+qbYQoholr1u\n\
t5ILo6FAaBc/nMH02ZzOoIyx+6O6qwvNeQ3o+wrWEjImJCULCXyxQVkWJLRHEBAQ\n\
gF7GaAGusQZMKiNXG0QyVGQZBM/BqiILFCWA+lkboQKBgQDC3MIjtOfjSxeS7EVZ\n\
M5L75G3WYrsf2LAs6R9TBgrID8X9FV4W/zPqbHZnF91THtFTYwVQs94SMjzD7TTJ\n\
HBLK/RJt5LC5SGECT9YOn8NZnXqeE5rBiRhEhQcG5XtrIjkZd8Q/Kf9GAtmwrcDm\n\
uER/qh47o4Y/N+CxVUEwrbbp/QKBgQC+fwN4grwWpZpZvq3Bpg4gdPz4hfao4Vbn\n\
E2TKxSPjBzfFiec4IIHnLW3C5RH+UbPrR8db2MevRgxNTozvAS59K1nQ23/lzzil\n\
+4Bdcsj4FHwDEbj/qeWaEgMPsjTXjk/ncJtCtbpBU26DYqjJTXiYrXDSfg/1NipO\n\
EWyvhM/5GQKBgQCczESPtN8vH1qNx/8Zgw2QEURs0S9ftd41lTS2etMsHr0jJBF9\n\
Ece1p6cy15opa0/m+HPrd4CHRdNtmK7z8NoSasdslCu8O8iLsrA9PkNUFgr3rjDF\n\
8MoNQLnhy8Ce+X/WxW+tn96geGSw7W+ed8HutHX1aWT5872jFEYLpIzeBQKBgQCp\n\
Q0JaOg/WL59OTtclUd8Lh+efC6l3tYH6IIlWgoS4nRk5NKd2f6vtNbhpjBDI4N/1\n\
FvpU6fHEE4Gqzzj6xRoBrhtIMUEbeVzkXuxYHD3l8I2gTIcM5HFWzNpbgATj41es\n\
VaofREoS8YcoxukitOuK/dFZtxmG0HIWm/TuoBwLQQKBgEu4T/5VPhDaVvpTUSM6\n\
GFyDI3NBxmjU4thLqLjmRt9SCkl3BwmTh2k5YICSuGTg4vEOnUxSwHQFkyxMryT3\n\
AquK24xodWIoB4JYjpXa5lQ2EB2/Gz7VvCzkGBCvlpLo5zTfs8AwyS9unlUfo36s\n\
wPZNNJw6I1Lb6A2nNg/QWjtl\n\
-----END PRIVATE KEY-----' >> /etc/ssl/private/wai.key
RUN echo '-----BEGIN CERTIFICATE-----\n\
MIIEFTCCAv2gAwIBAgIUEfk+YTIO77qlzECDdo/l6y8tb3gwDQYJKoZIhvcNAQEL\n\
BQAwgagxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH\n\
Ew1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBDbG91ZGZsYXJlLCBJbmMuMRswGQYD\n\
VQQLExJ3d3cuY2xvdWRmbGFyZS5jb20xNDAyBgNVBAMTK01hbmFnZWQgQ0EgYjhj\n\
MjkyYWU3ZTk1MTgyMjZlNDcyMmJmZTBmMWY4NDcwHhcNMjUwNTA3MTczMjAwWhcN\n\
NDAwNTAzMTczMjAwWjAiMQswCQYDVQQGEwJVUzETMBEGA1UEAxMKQ2xvdWRmbGFy\n\
ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJEAhj8hP4uIvKgUrBxE\n\
4Yn4HHs3BKYQHIeYvEWRZWLxkYo43QV6HxHEegK9/8VGp2LWbh7SyPCZGOz0jOJb\n\
q+xHAlFowj+T16HKqpeWYQ41B0JPoRpP84nDzznZUk1RnZSEI9X1Eqg+7OMNi/p/\n\
gFHgXG1l0e82vQNxeajfWdAt+Kp7eyjG92Gvt6T8EAzA4yghy3E/+Zjd6hVR0m1Z\n\
/jZwNGFGiK5TRUPPr+ECRmkAYqdx3uF2cYg/I1KQdknG+CBcff9IKnKQSCA/So58\n\
DN3fbp8DhCEpu7/p9N7wsMa6wMhQ64cx1gqwqKI3WUFdSGFPZ1PVFXp8mDguOIgG\n\
7rUCAwEAAaOBuzCBuDATBgNVHSUEDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAA\n\
MB0GA1UdDgQWBBR2IFd2cz9HKrNMsXS7op7U1viOATAfBgNVHSMEGDAWgBRrpByI\n\
P1c/+rNDS7oVjBThq0QFYTBTBgNVHR8ETDBKMEigRqBEhkJodHRwOi8vY3JsLmNs\n\
b3VkZmxhcmUuY29tLzliNjlhNTY3LTBiMzAtNDg5Yy1hNTFhLWU0MDU0NDM0OTM5\n\
Zi5jcmwwDQYJKoZIhvcNAQELBQADggEBABLO1KdyahzrrNtVWO6igEad6iHgTIJv\n\
wZCbE2MnZbHcBOcDYttO4w5QkHhVcVvRADyVwHM1c4CJWvpSdbxlWcX26oD2xrMN\n\
vvk1Qlpq75npLdi8ky9bj0lLXa1kVi0XdWQ424NNSQJcZ97JaRIVOb5kPTYFuxvH\n\
h/IBh9jzKRFtGAD4Yz4yGg7EPlW2aPW9zBm/jywVjzktwzCDEonrrKHQhzno5q67\n\
E6PVLHI9nTM4sVbPYQPlnVSFCkebwswDjmckN4JxUtU0ekXDGBSoDuLzrT0AsVDe\n\
EmlEpXn6GDnC+1jKRlAeDL84UaAZGN89eAwkBsga2NKHz7A0U37ChY4=\n\
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
' >> /etc/nginx/conf.d/default.conf
