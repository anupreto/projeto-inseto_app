FROM php:8.2-apache

# Instala as extensões necessárias para ligar ao MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Ativa o mod_rewrite do Apache
RUN a2enmod rewrite

# Copia os ficheiros para a pasta pública do Apache
COPY . /var/www/html/

# Define permissões corretas
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

EXPOSE 80