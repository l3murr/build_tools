FROM centrifugo/centrifugo:v6
RUN echo '{\n\
    "token": {\n\
        "hmac_secret_key": "test"\n\
    },\n\
    "http_api": {\n\
        "key": "test"\n\
    },\n\
    "client": {\n\
        "allowed_origins": [\n\
            "*"\n\
        ],\n\
        "proxy": {\n\
            "connect": {\n\
                "enabled": true,\n\
                "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000",\n\
                "timeout": "600s",\n\
                "http_headers": [\n\
                    "Cookie",\n\
                    "CHALLENGE",\n\
                    "RESPONSE"\n\
                ]\n\
            },\n\
            "refresh": {\n\
                "enabled": true,\n\
                "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000",\n\
                "timeout": "600s"\n\
            }\n\
        }\n\
    },\n\
    "channel": {\n\
        "proxy": {\n\
            "subscribe": {\n\
                "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000"\n\
            },\n\
            "publish": {\n\
                "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000"\n\
            }\n\
        },\n\
        "namespaces": [\n\
            {\n\
                "name": "web",\n\
                "subscribe_proxy_enabled": true\n\
            },\n\
            {\n\
                "name": "appliance",\n\
                "allow_subscribe_for_client": true,\n\
                "allow_subcribe_for_anonymous": true,\n\
                "allow_publish_for_subscriber": true,\n\
                "allow_publish_for_anonymous": true\n\
            }\n\
        ]\n\
    },\n\
    "rpc": {\n\
        "proxy": {\n\
            "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000",\n\
            "timeout": "600s",\n\
            "http_headers": [\n\
                "Cookie"\n\
            ]\n\
        },\n\
        "namespaces": [\n\
            {\n\
                "name": "web",\n\
                "proxy_enabled": true\n\
            },\n\
            {\n\
                "name": "appliance",\n\
                "proxy_enabled": true\n\
            }\n\
        ]\n\
    },\n\
    "admin": {\n\
        "enabled": false\n\
    }\n\
}\n' >> /centrifugo/config.json
CMD ["centrifugo"]
