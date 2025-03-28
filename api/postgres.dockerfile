FROM postgres:latest

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres

ADD setup-db.sh /docker-entrypoint-initdb.d
ADD initialData.sql /docker-entrypoint-initdb.d