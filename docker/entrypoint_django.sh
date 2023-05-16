#!/bin/bash
cd backend/ebooking/

python manage.py makemigrations hotels
python manage.py migrate hotels
python manage.py makemigrations accounts
python manage.py migrate accounts
python manage.py makemigrations
python manage.py migrate


python manage.py runserver 0.0.0.0:8000

exec "$@"
