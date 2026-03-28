#!/bin/sh
set -e

python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py run_import
python manage.py collectstatic --noinput
cp -r /app/collected_static/. /backend_static/static/
gunicorn --bind 0.0.0.0:8000 backend.wsgi