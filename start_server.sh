#!/bin/bash
echo 'Run Start Server Script...'
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (cd samuel_biebel_portfolio; python manage.py createsuperuser --no-input)
fi
(cd samuel_biebel_portfolio; gunicorn martor_demo.wsgi --user www-data --bind 0.0.0.0:8010 --workers 3) &
nginx -g "daemon off;"

