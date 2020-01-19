# how to setup a postgres db for local development

# create user
createuser zakk_admin -P

# create test / development databases
createdb zakk_admin_test -E unicode
createdb zakk_admin_development -E unicode

# set user rights
$ sudo su postgres
$ psql
= ALTER USER zakk_admin CREATEDB;
= GRANT ALL PRIVILEGES ON DATABASE "zakk_admin_development" TO zakk_admin;
= GRANT ALL PRIVILEGES ON DATABASE "zakk_admin_test" TO zakk_admin;
