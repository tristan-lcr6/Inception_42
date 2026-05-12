FROM debian:bookworm

RUN apt update && apt install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY website/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=jferrand.42.fr"

CMD ["nginx", "-g", "daemon off;"]