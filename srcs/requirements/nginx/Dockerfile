FROM debian:bullseye

# Install NGINX and OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Create SSL directory and generate self-signed certificate
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-ssl.key \
    -out /etc/nginx/ssl/nginx-ssl.crt \
    -subj "/C=Spain/ST=Malaga/L=Malaga/O=Malaga42/OU=/CN=jesopan-42.fr"

# Copy custom NGINX configuration
COPY ./conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Expose HTTPS port
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
