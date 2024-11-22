FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/jesopan-.42.fr.key -out /etc/nginx/ssl/jesopan-.42.fr.crt -subj "/C=/ST=/L=/O=/OU=/CN=/UID="

# /etc/nginx/sites-available/ is the directory where Nginx expects to find its configuration files.
COPY ./config /etc/nginx/sites-available/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
