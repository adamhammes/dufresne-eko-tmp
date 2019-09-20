FROM node:10 as npm

WORKDIR app/

COPY statamic/site/themes/dufresnes/package.json .
COPY statamic/site/themes/dufresnes/yarn.lock .

RUN yarn

COPY statamic/site/themes/dufresnes/ .

RUN yarn build

FROM composer:1.9.0 as php-installer

WORKDIR /app
COPY statamic/site/ site/
COPY statamic/statamic statamic/
RUN cd statamic && php composer.phar install

FROM php:7-fpm

COPY config/php.ini /usr/local/etc/php/

COPY statamic/ /var/www/statamic-site/
COPY --from=php-installer /app/statamic/vendor /var/www/statamic-site/statamic/vendor


COPY --from=npm /app/css /var/www/statamic-site/site/themes/dufresnes/css
COPY --from=npm /app/js /var/www/statamic-site/site/themes/dufresnes/js
RUN chmod 777 /var/www/statamic-site/


