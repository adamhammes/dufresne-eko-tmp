FROM nginx:latest
COPY config/statamic.nginx.conf /etc/nginx/conf.d
COPY statamic/ /var/www/statamic-site/

