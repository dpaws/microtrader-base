FROM openjdk:8-jre-alpine
MAINTAINER Justin Menga <justin.menga@gmail.com>

# Install system dependencies
RUN echo "http://nl.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache bash confd && \
    mkdir -p /app/conf

# Copy common confd templates
COPY etc/confd /etc/confd

# Set entrypoint
COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]