#!/bin/bash
[ -e project.db ] && rm project.db
./manage.py clear_index --noinput
./manage.py migrate
cp project.db project.db.empty
./manage.py bootstrap
./manage.py runserver
