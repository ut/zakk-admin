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


## Credits

Designed and developed by Ulf Treger, <ulf.treger@googlemail.com>

## Contributions

Please file bugs to our Github Repository at https://github.com/ut/zakk-admin

## Licence

This project is licensed under a [GNU General Public Licence v3](https://github.com/ut/zakk-admin/blob/master/LICENSE)
