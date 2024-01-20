FROM php:7.4.33-fpm

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN chown www-data:www-data "$PHP_INI_DIR"

# Extenstion Requirements:
# 	zlib1g-dev libpng-dev: required for 'gd' extension
# 	libonig-dev: required for 'mbstring' extension
# 	libzip-dev: required for 'zip' extension
# 	libcurl4-openssl-dev: required for 'curl' extension
RUN apt update && apt install -y zlib1g-dev libpng-dev libonig-dev libzip-dev \
	libcurl4-openssl-dev && rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug-3.1.5

# Install and enable PHP extension requirements for Symbiota
RUN docker-php-ext-install mysqli gd mbstring zip curl exif && \
	docker-php-ext-enable mysqli gd mbstring zip curl exif xdebug