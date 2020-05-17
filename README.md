# About Dockerfile

Official image of wordpress php 7.4 apache, with redis extension and some useful tools. If you want to ose another php version you the see the original repo or maybe change the image of that Dockerfile). 

[Official repo of wordpress](https://github.com/docker-library/wordpress/tree/master/php7.4/apache)


# Why redis extension?

It is necessary to later configure redis (accompanied by a redis container from docker-compose.yml), to store the wordpress cache. To configure which cache to store we will do it from wordpress with the w3 total cache plug-in or simply with the redis 
cache plugin

# REDIS PHP CACHE
The php cache is already set to be sent to redis. (Already configured in the Dockerfile)

# REDIS PLUGIN OF WORDPRESS
The redis plugin wordpress is already installed in the Dockerfile. 


# CONFIGURATION

## WP-CONFIG.PHP file 

**The following configurations are required for plugins like w3 total cache...and others**

Add this lines:

**define('WP_CACHE', true);**  
**define( 'WP_CACHE_KEY_SALT', 'example.com' );**  
**define('WP_REDIS_HOST', 'redis');** // redis because is the name of the container. Maybe can be 'localhost' if redis is installed on localhost.  
**define('WP_REDIS_PASSWORD', 'pruebas1234');**  // password if you hae configured redis with password in the docker-compose.yml

## Edit docker-compose.yml file as you need

Edit and add your certificates in /srv/traefik in your server. Put mariadb root password, username and user password. Also add that passwords in wordpress section. That is, where you see **XXXXXXX**. 
