FROM centrifugo/centrifugo:v6
RUN echo '{\
    "token": {\
        "hmac_secret_key": "test"\
    },\
    "http_api": {\
        "key": "test"\
    },\
    "client": {\
        "allowed_origins": [\
            "*"\
        ],\
        "proxy": {\
            "connect": {\
                "enabled": true,\
                "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000",\
                "timeout": "600s",\
                "http_headers": [\
                    "Cookie",\
                    "CHALLENGE",\
                    "RESPONSE"\
                ]\
            },\
            "refresh": {\
                "enabled": true,\
                "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000",\
                "timeout": "600s"\
            }\
        }\
    },\
    "channel": {\
        "proxy": {\
            "subscribe": {\
                "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000"\
            },\
            "publish": {\
                "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000"\
            }\
        },\
        "namespaces": [\
            {\
                "name": "web",\
                "subscribe_proxy_enabled": true\
            },\
            {\
                "name": "appliance",\
                "allow_subscribe_for_client": true,\
                "allow_subcribe_for_anonymous": true,\
                "allow_publish_for_subscriber": true,\
                "allow_publish_for_anonymous": true\
            }\
        ]\
    },\
    "rpc": {\
        "proxy": {\
            "endpoint": "grpc://server-service-1.default.svc.cluster.local:30000",\
            "timeout": "600s",\
            "http_headers": [\
                "Cookie"\
            ]\
        },\
        "namespaces": [\
            {\
                "name": "web",\
                "proxy_enabled": true\
            },\
            {\
                "name": "appliance",\
                "proxy_enabled": true\
            }\
        ]\
    },\
    "admin": {\
        "enabled": false\
    }\
}' >> /centrifugo/config.json
CMD ["centrifugo"]
