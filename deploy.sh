#!/bin/bash

php artisan down || true

git pull origin master

composer dump-autoload -o
composer install --optimize-autoloader --no-dev

php artisan migrate --force --seed

php artisan cache:clear
php artisan route:cache
php artisan config:cache
php artisan view:cache

php artisan up
