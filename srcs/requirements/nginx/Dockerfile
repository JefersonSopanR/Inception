FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/default /etc/nginx/sites-available/default

WORKDIR /workspace
COPY ./tools/installer.sh .
RUN chmod +x installer.sh

CMD ["./installer.sh"]
