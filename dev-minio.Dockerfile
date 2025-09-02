FROM minio/minio:RELEASE.2024-01-16T16-07-38Z

# Create data directory
RUN mkdir -p /data

# Set default environment variables
ENV MINIO_ROOT_USER=minioadmin
ENV MINIO_ROOT_PASSWORD=minioadmin

# Expose ports
EXPOSE 9000 9001

# Set the entrypoint
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["server", "/data", "--console-address", ":9001"]
