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
`/users/:id.json`

Verb: __GET__

Params:

  - id: integer: Necessary

Example:

```bash
curl -v -H "Accept: application/json" http://localhost:3000/users/1.json
```
