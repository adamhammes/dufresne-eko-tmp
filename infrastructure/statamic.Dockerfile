FROM node:10 as npm

WORKDIR app/

COPY statamic/site/themes/dufresnes/package.json .
COPY statamic/site/themes/dufresnes/yarn.lock .

RUN yarn

COPY statamic/site/themes/dufresnes/ .

RUN yarn build

FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
    libjpeg62-turbo-dev \
    libpng-dev \
    zlib1g-dev \
    libzip-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-install exif \
  && docker-php-ext-install zip

COPY config/php.ini /usr/local/etc/php/

COPY statamic/ /var/www/statamic-site/
RUN (cd /var/www/statamic-site/statamic && php composer.phar install)

COPY --from=npm /app/css /var/www/statamic-site/site/themes/dufresnes/css
COPY --from=npm /app/js /var/www/statamic-site/site/themes/dufresnes/js
RUN chmod 777 /var/www/statamic-site/

