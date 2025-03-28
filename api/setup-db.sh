#!/bin/bash
echo 'starting initial data'
if [[ -z $(psql -Atqc '\list companies' postgres) ]]; then
  createdb companies;
  echo 'Database created'
  psql -U postgres -d 'companies' -f /docker-entrypoint-initdb.d/initialData.sql

  else
    echo 'Database already exists'
fi

