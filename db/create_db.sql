# how to setup a postgres db for local development

# create user
createuser zakk_admin -P

only for local dev installs:
$ ALTER ROLE zakk_admin4_test SUPERUSER;

# test / development
createdb zakk_admin4_test -E unicode
createdb zakk_admin4_development -E unicode

# set user rights
$ sudo su postgres
$ psql
= ALTER USER zakk_admin4 CREATEDB;
= GRANT ALL PRIVILEGES ON DATABASE "zakk_admin_development" TO zakk_admin;
= GRANT ALL PRIVILEGES ON DATABASE "zakk_admin_test" TO zakk_admin;
