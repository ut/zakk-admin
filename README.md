[![Build Status](https://travis-ci.org/ut/zakk-admin.svg?branch=master)](https://travis-ci.org/ut/zakk-admin) [![Code Climate](https://api.codeclimate.com/v1/badges/7ff4670aaf0ef66ccb83/maintainability)](https://codeclimate.com/github/ut/zakk-admin/maintainability) [![Coverage Status](https://coveralls.io/repos/github/ut/zakk-admin/badge.svg?branch=master)](https://coveralls.io/github/ut/zakk-admin?branch=master)




# zakk-admin

Website and admin interface for zakk (a cultural center in Bremen, GER)

Based on Ruby on Rails 5, Postgres, jQuery and Foundation 5

## Dependencies

Rails 5 & Ruby 2.3, Rspec

Qt for the [compiling of capybara-webkit](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)

## Installation

Set up configuration: Copy all *.example files in /config and change them as needed.

### Database Setup

This application relies on a PostgreSQL database. Setup a database, check db/create_db.sql for some basic commands.
Define database name and user at config/database.yml

Run migrations

`$ bundle exec bin/rails db:migrate`

Run seeds

`$ bundle exec bin/rails db:seeds`

### Testing w/RSpec


`$ bundle exec rspec spec`


## Run

`$ bundle exec bin/rails s`


## Travis CI

[Encrypt config files for safe usage in Travis](https://docs.travis-ci.com/user/encrypting-files/), without publishing it to Github

Before: [Install Travis CLI](https://docs.travis-ci.com/user/encrypting-files/) with Ruby 2.1 (with Ruby 2.3 it is not working yet)


```
$ rm use ruby-2.1.8
$ gem install travis

```

Adding secret files to .travis.yml

```
$ tar cvf secrets.tar config/application.rb config/database.yml config/environment.rb config/secrets.yml config/settings.yml
$ travis encrypt-file secrets.tar --add
```

[Setting up Postgres database](https://docs.travis-ci.com/user/database-setup/#PostgreSQL)


## Credits

Designed and developed by Ulf Treger <ulf.treger@googlemail.com>

## Contributions

Please file bugs to our Github Repository at https://github.com/ut/zakk-admin

## Licence

This project is licensed under a [GNU General Public Licence v3](https://github.com/ut/zakk-admin/blob/master/LICENSE)
