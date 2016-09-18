FROM openjdk:8-jre-alpine
MAINTAINER Justin Menga <justin.menga@gmail.com>

# Install system dependencies
RUN echo "http://nl.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache bash confd && \
    mkdir -p /app/conf

# Copy common confd templates
COPY etc/confd /etc/confd

# Set entrypoint and default command arguments
COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["java", "-jar", "/app/app.jar", "-cluster", "-Dvertx.hazelcast.config=/app/conf/cluster.xml"]