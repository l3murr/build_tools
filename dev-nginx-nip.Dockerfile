FROM nginx:1.27.4
RUN echo '-----BEGIN PRIVATE KEY-----\n\
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgyHvaAtjiSS3hrfdM\n\
5TtgkscFE5VJfpkWnq49zM1mjGGhRANCAASOiFOO3hzzRo0dcclNGLrdJ8Oh9qnT\n\
NkFybKhDEuF1EFIYJvsuPhAQczJzaa7ktSdXjzS4WumYEEhJkLo+klYT\n\
-----END PRIVATE KEY-----' >> /etc/ssl/private/wai.key
RUN echo '-----BEGIN CERTIFICATE-----\n\
MIIDhzCCAw2gAwIBAgISBR9DUUXZpsC5/fyqpCgdVlOyMAoGCCqGSM49BAMDMDIx\n\
CzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQswCQYDVQQDEwJF\n\
NTAeFw0yNTA1MDcxNzA2MzZaFw0yNTA4MDUxNzA2MzVaMBMxETAPBgNVBAMTCHRt\n\
bnAubmV0MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEjohTjt4c80aNHXHJTRi6\n\
3SfDofap0zZBcmyoQxLhdRBSGCb7Lj4QEHMyc2mu5LUnV480uFrpmBBISZC6PpJW\n\
E6OCAiAwggIcMA4GA1UdDwEB/wQEAwIHgDAdBgNVHSUEFjAUBggrBgEFBQcDAQYI\n\
KwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUJCgwG21C1XcgCLtphFGF\n\
2kr6oWYwHwYDVR0jBBgwFoAUnytfzzwhT50Et+0rLMTGcIvS1w0wMgYIKwYBBQUH\n\
AQEEJjAkMCIGCCsGAQUFBzAChhZodHRwOi8vZTUuaS5sZW5jci5vcmcvMB8GA1Ud\n\
EQQYMBaCCioudG1ucC5uZXSCCHRtbnAubmV0MBMGA1UdIAQMMAowCAYGZ4EMAQIB\n\
MC0GA1UdHwQmMCQwIqAgoB6GHGh0dHA6Ly9lNS5jLmxlbmNyLm9yZy81MS5jcmww\n\
ggECBgorBgEEAdZ5AgQCBIHzBIHwAO4AdQAN4fIwK9MNwUBiEgnqVS78R3R8sdfp\n\
MO8OQh60fk6qNAAAAZar7DZuAAAEAwBGMEQCIEJJqSfDLQ9QObtWiWGfETv56GYm\n\
Q0aGbKPFE26NBB3QAiAgiDHu/MyqjmDt9Ld06ibbNxDxSXD04zauVklSh0H6AwB1\n\
ABoE/0nQVB1Ar/agw7/x2MRnL07s7iNAaJhrF0Au3Il9AAABlqvsOTIAAAQDAEYw\n\
RAIgUfRovGbWl3JHM7wj5ZyBfusQq/fWPhvqnkQb9onsVVgCIA2LrB3tE648FBO8\n\
lmnQdiu19paBwjYzvnbuO/n2MqZwMAoGCCqGSM49BAMDA2gAMGUCMQCiBwzVyhJt\n\
Ukayr7raUnUmOG97Bqv6XnE7cJh1Z6hf+rXt6rBCWYL2vKnFk7sxoTkCMHgBczpJ\n\
CcS/arkz2pv4jePk0+oHPzywFUFz4nYVGxPZVgvuek6iVjGoehQU/Hs1gw==\n\
-----END CERTIFICATE-----\n\
-----BEGIN CERTIFICATE-----\n\
MIIEVzCCAj+gAwIBAgIRAIOPbGPOsTmMYgZigxXJ/d4wDQYJKoZIhvcNAQELBQAw\n\
TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh\n\
cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMjQwMzEzMDAwMDAw\n\
WhcNMjcwMzEyMjM1OTU5WjAyMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNTGV0J3Mg\n\
RW5jcnlwdDELMAkGA1UEAxMCRTUwdjAQBgcqhkjOPQIBBgUrgQQAIgNiAAQNCzqK\n\
a2GOtu/cX1jnxkJFVKtj9mZhSAouWXW0gQI3ULc/FnncmOyhKJdyIBwsz9V8UiBO\n\
VHhbhBRrwJCuhezAUUE8Wod/Bk3U/mDR+mwt4X2VEIiiCFQPmRpM5uoKrNijgfgw\n\
gfUwDgYDVR0PAQH/BAQDAgGGMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcD\n\
ATASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBSfK1/PPCFPnQS37SssxMZw\n\
i9LXDTAfBgNVHSMEGDAWgBR5tFnme7bl5AFzgAiIyBpY9umbbjAyBggrBgEFBQcB\n\
AQQmMCQwIgYIKwYBBQUHMAKGFmh0dHA6Ly94MS5pLmxlbmNyLm9yZy8wEwYDVR0g\n\
BAwwCjAIBgZngQwBAgEwJwYDVR0fBCAwHjAcoBqgGIYWaHR0cDovL3gxLmMubGVu\n\
Y3Iub3JnLzANBgkqhkiG9w0BAQsFAAOCAgEAH3KdNEVCQdqk0LKyuNImTKdRJY1C\n\
2uw2SJajuhqkyGPY8C+zzsufZ+mgnhnq1A2KVQOSykOEnUbx1cy637rBAihx97r+\n\
bcwbZM6sTDIaEriR/PLk6LKs9Be0uoVxgOKDcpG9svD33J+G9Lcfv1K9luDmSTgG\n\
6XNFIN5vfI5gs/lMPyojEMdIzK9blcl2/1vKxO8WGCcjvsQ1nJ/Pwt8LQZBfOFyV\n\
XP8ubAp/au3dc4EKWG9MO5zcx1qT9+NXRGdVWxGvmBFRAajciMfXME1ZuGmk3/GO\n\
koAM7ZkjZmleyokP1LGzmfJcUd9s7eeu1/9/eg5XlXd/55GtYjAM+C4DG5i7eaNq\n\
cm2F+yxYIPt6cbbtYVNJCGfHWqHEQ4FYStUyFnv8sjyqU8ypgZaNJ9aVcWSICLOI\n\
E1/Qv/7oKsnZCWJ926wU6RqG1OYPGOi1zuABhLw61cuPVDT28nQS/e6z95cJXq0e\n\
K1BcaJ6fJZsmbjRgD5p3mvEf5vdQM7MCEvU0tHbsx2I5mHHJoABHb8KVBgWp/lcX\n\
GWiWaeOyB7RP+OfDtvi2OsapxXiV7vNVs7fMlrRjY1joKaqmmycnBvAq14AEbtyL\n\
sVfOS66B8apkeFX2NY4XPEYV4ZSCe8VHPrdrERk2wILG3T/EGmSIkCYVUMSnjmJd\n\
VQD9F6Na/+zmXCc=\n\
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
