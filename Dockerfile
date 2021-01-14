FROM wordpress:php7.4-apache
LABEL name="nanih98/wordpress:5.5.1-apache"

# Setup upload max filesize

COPY uploads.ini /usr/local/etc/php/conf.d/

#Configure php cache to send data to redis. 

RUN set -eux ;\
    sed -i 's/session.save_handler = files/session.save_handler = redis/g' /usr/local/etc/php/php.ini-production;\
    sed -i '/session.save_handler/a session.save_path = "tcp://redis"' /usr/local/etc/php/php.ini-production ;\
    cp -a /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini ;\
    export PHPRC=/usr/local/etc/php/php.ini

# Configure redis extension
RUN set -eux; \
    pecl install redis 

COPY redis.ini /usr/local/etc/php/conf.d/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
