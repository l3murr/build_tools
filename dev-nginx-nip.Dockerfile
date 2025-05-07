FROM nginx:1.27.4
RUN echo '-----BEGIN PRIVATE KEY-----\n\
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDT2T4Y5oH3NmUU\n\
5n0zeDsq56UR098lIqJMo5i4uzD92C19yeCYfGtO0GS7ivK7gKc2lBMXpU9pjrXO\n\
e2D02LTiFRvjaI7SEXJRrrX0V201dfvBwPb0z7xirm1T9Vau5MXCN6/xBkGG3DH2\n\
aQ0PJAqRk6eTE89Nz9SR80eBr1knE9z+YPgxGryD2z5jne5XI5Y9boSOTwJhiCbF\n\
glcDEnTqP7hngJqht1qsfPxYbQX6XcckTdpWWQuBmruSS0g+l+lHQVIyXdlbAcdi\n\
xqKEPo0PmAGjf8OPcpBxm869M+kw/mEI6k5jVLu+5yJZ2Vw9Xb6XGLmxpfd3jkPL\n\
V2wnwlNRAgMBAAECggEAAj9IQQj9bREV9Yi8IGIUrRfl1KyE3gLJ+lKEL8X3DyNG\n\
WMKt4+oydHSiE+n1eRMUWwArO22KzAuqLqt4/+HmWc1X5VO2K6DpH7gQ6KuOflIf\n\
Ans0t2w2cyzG3ryQD8UAGsc+0dmDU44VhtfOjlf/V3Pbs8QCl4CGUInGSvgwY7ll\n\
lN2ASYvPoRYCgkm5QYtbHIOR07KtOuD1sDS01RXb1Ih1esHRwheBzSll2OkCa3fm\n\
orOm6y531LJxFsdwTU5uHiZ9zEhtxD+UMBnqIJ3n3IxubSlr9u4J+L/qrhutbDMh\n\
YxYZNXtG9oOkOn6nv7tq9X8xApVpB4xN9OxzHT8U4QKBgQD09UFEDa/als76tVZ/\n\
aCOJypix/WU3nvC0iqYz8FD8F3CTmcMQD2a7HBG7fKPuOqfJ5MZIAuBKAJ6nEfla\n\
8S+0TzwMl9HUCSCuLy9iaYMzWpM4twUqqbM83johq7Zim8DRtdjYzY6R5/XbuJ2+\n\
YFgVH1VpelMAcSYWv4Ok3tt6YQKBgQDdZeoXOaMdET70jzERtvZquLB1Rz1dR1IH\n\
uQvDxjSOkRvfVTDdnuYUEyo7Slur1oQfaUQACFheYobrJ0NrorVnx7eXTKAeNAoL\n\
EqQftdH7haMjzNe3ih8y4TEMIrw7NPKXADfa9hk5LPVgFKbY/D0U6Xj4nEC31xRU\n\
Rb7SDYTe8QKBgQDv7km/HqjgslaJupS+toIYtRhbPpelo0ihjiy9MuYgBdV+vV0S\n\
ngNBwnyb57mp3kn6ttqALlECKxk7C5/yM8tGEVX//7TGuyoHcrA29KJN6qnJI3ss\n\
DoxBUmoeENLUQzraLgP4V18OCuYGEQ5xKm0cQ1Slu+sQw8NLBMss8hyIAQKBgQCt\n\
d827ltBj1QBjs9H5lEZshfrUWRYOgPQX0vgR07mYPr/8843PB1I0RnPfcrpy4Cgz\n\
SFIcSG2cvkwB8YiUzC6ges4xQLtwDswTsu5fXiGBlkqloTkfuJwLTIAWhxy+sxSk\n\
FWquKAbJUp2LQ4MbHj9ppCjBegQHRwDJqsABatBBsQKBgQCAz+3gQT/XI1I5abQB\n\
f3w1siJi4r2XSH+x+FEyV4uGIag+qfRbWZPbKvPkRVMfO6GgGOUfdmFe37jtilD7\n\
kx31BPbQj5PH6NxgJW3cUg2m2Ocx/l141dxZJWqCEAw+Jc6jMFJtpWPtXql6dp+V\n\
yMGHz1Vxhmpl0VslZ4JCNS5dyg==\n\
-----END PRIVATE KEY-----' >> /etc/ssl/private/wai.key
RUN echo '-----BEGIN CERTIFICATE-----\n\
MIIEFTCCAv2gAwIBAgIUfe69QN/A42VVRA8pOjEYBFWulSAwDQYJKoZIhvcNAQEL\n\
BQAwgagxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH\n\
Ew1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBDbG91ZGZsYXJlLCBJbmMuMRswGQYD\n\
VQQLExJ3d3cuY2xvdWRmbGFyZS5jb20xNDAyBgNVBAMTK01hbmFnZWQgQ0EgYjhj\n\
MjkyYWU3ZTk1MTgyMjZlNDcyMmJmZTBmMWY4NDcwHhcNMjUwNTA2MjExMDAwWhcN\n\
MzUwNTA0MjExMDAwWjAiMQswCQYDVQQGEwJVUzETMBEGA1UEAxMKQ2xvdWRmbGFy\n\
ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANPZPhjmgfc2ZRTmfTN4\n\
OyrnpRHT3yUiokyjmLi7MP3YLX3J4Jh8a07QZLuK8ruApzaUExelT2mOtc57YPTY\n\
tOIVG+NojtIRclGutfRXbTV1+8HA9vTPvGKubVP1Vq7kxcI3r/EGQYbcMfZpDQ8k\n\
CpGTp5MTz03P1JHzR4GvWScT3P5g+DEavIPbPmOd7lcjlj1uhI5PAmGIJsWCVwMS\n\
dOo/uGeAmqG3Wqx8/FhtBfpdxyRN2lZZC4Gau5JLSD6X6UdBUjJd2VsBx2LGooQ+\n\
jQ+YAaN/w49ykHGbzr0z6TD+YQjqTmNUu77nIlnZXD1dvpcYubGl93eOQ8tXbCfC\n\
U1ECAwEAAaOBuzCBuDATBgNVHSUEDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAA\n\
MB0GA1UdDgQWBBQP8aYEjW9N3U9v+ryxu2JnYhrGdDAfBgNVHSMEGDAWgBRrpByI\n\
P1c/+rNDS7oVjBThq0QFYTBTBgNVHR8ETDBKMEigRqBEhkJodHRwOi8vY3JsLmNs\n\
b3VkZmxhcmUuY29tLzliNjlhNTY3LTBiMzAtNDg5Yy1hNTFhLWU0MDU0NDM0OTM5\n\
Zi5jcmwwDQYJKoZIhvcNAQELBQADggEBAAY+cfBrp9siX73qlirVl0yHXzCn5/V9\n\
6L2XuHs8vwulpaXEKy2WCPrVYY5H+HbYojaqlnzvsls6gFx2+gCW7PjcF2ffpXbV\n\
tkLtD1UEjYtl9/AzkGgSx43HIXEhTTuQGWddpfyvhhXQBzGburI8TGos7uGyKlkp\n\
PBmNqvlUr3QDuamTX+Bts3e9oosegdJvJGOvwIDTF47KeY2mVkAhl/JBUadU2gPp\n\
FGAqjKxqsprY30XWkPctOeXdQCGmNKTff9EyoVYcr6klmQ5ByZLZBg7ZGr1tWFGO\n\
3NEAiX5vvwrXKvj9tpT/LFOAiTlIGFVFzXgWVVjW6uSUjRBzrvAlndo=\n\
-----END CERTIFICATE-----' >> /etc/ssl/private/wai.crt
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
