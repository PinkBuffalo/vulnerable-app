[![Build Status](https://travis-ci.org/PinkBuffalo/vulnerable-app.png?branch=master)](https://travis-ci.org/PinkBuffalo/vulnerable-app)

# Vulnerable

_Assuming you have rbenv or rvm already installed._


1. Install postgresql (use homebrew)
```bash
brew install postgresql
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
which psql
```
2. git clone git@github.com:PinkBuffalo/vulnerable-app.git
3. Setup your db and start the db server.
  3.1 copy config/database.yml.example to config/database.yml
  3.2 Adjust config/database.yml with your settings.
4. bundle exec rake db:setup
5. bundle exec rake db:migrate
6. bundle exec rails s


# Endpoints

## api/v1/users

### Create a new user
`api/v1/users`

Verb: __POST__

Params:

Everything wrapped inside a user object.
  - email: String: Necessary
  - name: String: Optional

Example:
```bash
curl  -v -H "Accept: application/json" \
      -H "Content-type: application/json" \
      -X POST \
      -d '{"user":{"name":"Test user","email":"test@email.com"}}' \
      http://localhost:3000/api/v1/users
```

### Retrieve user's information
`api/v1/users/{:id}`

Verb: __GET__

Params:

  - id: integer: Necessary

Example:
```bash
curl -v -H "Accept: application/json" http://localhost:3000/api/v1/users/1
```

## api/v1/users/{:id}/stories

### List user's stories

`api/v1/users/{:id}/stories`

Verb: __GET__

Params:
  - Id: integer: Id of the user

Example:
```bash
curl -v -H "Accept: application/json" \
     http://localhost:3000/api/v1/users/1/stories
```

## api/v1/users/{:user_id}/favorite_stories

### List user's favorite stories
`api/v1/users/{:user_id}/favorite_stories`

Verb: __GET__

Example:
```bash
curl -v -H "Accept: application/json" \
     http://localhost:3000/api/v1/users/1/favorite_stories
```

### Favorite a story for a user

`api/v1/users/{:user_id}/favorite_stories`

Verb: __POST__

Example:
```bash
curl -v -H "Accept: application/json" \
      -H "Content-type: application/json" \
      -X POST \
      -d '{"id":"23"}' \
     http://localhost:3000/api/v1/users/1/favorite_stories
```

### Unfavorite a story for a user

`api/v1/users/{:user_id}/favorite_stories`

Verb: __DELETE__

Params:
  - Id: integer: Id of the story

Example:
```bash
curl -v -H "Accept: application/json" \
      -H "Content-type: application/json" \
      -X DELETE \
      -d '{"id":"23"}' \
     http://localhost:3000/api/v1/users/1/favorite_stories
```

## api/v1/timeline

### List recent stories

`api/v1/timeline`

Verb: __GET__

Example:
```bash
curl -v -H "Accept: application/json" http://localhost:3000/api/v1/timeline
```
