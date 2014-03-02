# Vulnerable

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


# Endpoints

## /users

### Create a new user
`/users.json`

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
      http://localhost:3000/users.json
```

### Retrieve user's information
`/users/{:id}.json`

Verb: __GET__

Params:

  - id: integer: Necessary

Example:
```bash
curl -v -H "Accept: application/json" http://localhost:3000/users/1.json
```

## /users/{:id}/stories

### List user's stories

`/users/{:id}/stories.json`

Verb: __GET__

Params:
  - Id: integer: Id of the user

Example:
```bash
curl -v -H "Accept: application/json" \
     http://localhost:3000/users/1/stories.json
```

## /users/{:user_id}/favorite_stories

### List user's favorite stories
`/users/{:user_id}/favorite_stories.json`

Verb: __GET__

Example:
```bash
curl -v -H "Accept: application/json" \
     http://localhost:3000/users/1/favorite_stories.json
```

### Favorite a story for a user

`/users/{:user_id}/favorite_stories.json`

Verb: __POST__

Example:
```bash
curl -v -H "Accept: application/json" \
      -H "Content-type: application/json" \
      -X POST \
      -d '{"id":"23"}' \
     http://localhost:3000/users/1/favorite_stories.json
```

### Unfavorite a story for a user

`/users/{:user_id}/favorite_stories.json`

Verb: __DELETE__

Params:
  - Id: integer: Id of the story

Example:
```bash
curl -v -H "Accept: application/json" \
      -H "Content-type: application/json" \
      -X DELETE \
      -d '{"id":"23"}' \
     http://localhost:3000/users/1/favorite_stories.json
```

## /timeline.json

### List recent stories

`/timeline.json`

Verb: __GET__

Example:
```bash
curl -v -H "Accept: application/json" http://localhost:3000/timeline.json
```
