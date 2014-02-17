# Vulerable

In order to run vulnerable backend in your computer, you need to the
following.

1. Install mysql
2. Install rbenv or rvm
3. git clone git@github.com:PinkBuffalo/vulnerable-app.git
4. If your database has different credentials from user root password
   password, then you need to change accordingly on
`config/database.yml`
5. bundle exec rake db:setup
6. bundle exec rake db:migrate
7. bundle exec rails s


## Current endpoints

`/users`

__POST__
Create a new user

__Parameters__

Everything wrapped inside a user object.

email: String: Necessary
name: String: Optional


__GET__
Fetch user

__Parameters__

id: integer: Necessary
