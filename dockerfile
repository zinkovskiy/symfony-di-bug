FROM php:8.2-alpine

RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /tmp/composer-setup.php;

RUN set -eux; \
    apk add --no-cache linux-headers; \
	apk add --no-cache --virtual .build-deps $PHPIZE_DEPS rabbitmq-c-dev; \
    pecl install apcu amqp; \
    pecl clear-cache; \
    docker-php-ext-enable amqp;

WORKDIR /var/www

COPY . ./

CMD ["tail", "-f", "/dev/null"]