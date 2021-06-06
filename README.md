# README

## Creating project notebook api
```bash
rails new notebook-api --api
```

## Creating first scaffold
```bash
rails g scaffold Contact name:string email:string birthdate:date
rails db:migrate
```

## Working cURL
```bash
# See all contacts
 curl http://127.0.0.1:3000/contacts

# See the contact 1
 curl http://127.0.0.1:3000/contacts/1

# See the contact 1 with verbose
 curl http://127.0.0.1:3000/contacts/1 -v

# See the contact 1 with verbose use verb
 curl http://127.0.0.1:3000/contacts/1 -v -X GET

# Create a new contact use verb POST in json
curl http://127.0.0.1:3000/contacts -i -v -X POST -H "Content-Type: application/json" -d '{"name": "alanalves","email": "alanalves@empresa.corp"}'

# Updating the contact use verb PATCH
curl http://127.0.0.1:3000/contacts/101 -i -v -X PATCH -H "Content-Type: application/json" -d '{"name": "alansilva","email": "alan@empresa.corp"}'

# See new contact 101
 curl http://127.0.0.1:3000/contacts/101

# Deleting a contact use verb DELETE
 curl http://127.0.0.1:3000/contacts/101 -i -v -X DELETE

```

## Creating new scaffold for type
```bash
rails g scaffold Kind description:string
rails db:migrate
```
## Creating migration of references
```bash
rails g migration add_kind_to_contact kind:references
rails db:migrate
```

## Creating data of tests on task dev setup
```bash
rails db:drop db:create db:migrate dev:setup
```

## Create new contact with kind_id
```bash
##
curl http://127.0.0.1:3000/contacts -i -v -X POST -H "Content-Type: application/json" -d '{ "name": "alanalves","email": "alanalves@empresa.corp", "birthdate":"2002-05-27", "kind_id":3 }'

##
curl http://127.0.0.1:3000/contacts/101 -i -v

```

## Creating model Phone references contact
```bash
rails g model Phone number:string contact:references
```

## Recreate new tasks for phone
```bash
vim lib/tasks/dev.rake

rails db:drop db:create db:migrate dev:setup --trace
```

## Serializer added on project

```bash
rails g serializer contact
rails g serializer kind

```

## Mine/Media Types - locked call with header only "Accept: application/vnd.api+json"

```bash
curl http://127.0.0.1:3000/contacts/4 -H "Accept: application/vnd.api+json" -v

curl http://127.0.0.1:3000/contacts -H "Accept: application/vnd.api+json" -v
```

## relationships and routes belongs_to

```bash
curl http://127.0.0.1:3000/contacts -H "Accept: application/vnd.api+json" -v

curl http://localhost:3000/contacts/4/relationships/kind -H "Accept: application/vnd.api+json"
```

## CRUD AMS with has_one(address)

```bash

curl http://localhost:3000/contacts/100/address -X DELETE -H "Accept: application/vnd.api+json"

curl http://localhost:3000/contacts/100/address -X DELETE -H "Accept: application/vnd.api+json"

curl http://localhost:3000/contacts/100/address -H "Accept: application/vnd.api+json"

```

## CRUD AMS with has_many(phones)

```bash

curl http://localhost:3000/contacts/99/phones -H "Accept: application/vnd.api+json"

```

## Authenticate Http Basic used Base64

```bash

curl http://localhost:3000/kinds -v -I -H "Accept: application/vnd.api+json" -u alan:secret

curl http://localhost:3000/kinds -v -I -H "Accept: application/vnd.api+json" -u alan:secreterror

curl http://localhost:3000/kinds -v -I -H "Accept: application/vnd.api+json" -u alan:secret

```

## Authenticate Http with Digest used MD5

```bash

curl http://localhost:3000/kinds -v -I -H "Accept: application/vnd.api+json" -u alan:secret --digest

```

## Authenticate Http with Token

```bash

curl http://localhost:3000/kinds -H "Accept: application/vnd.api+json" -H "Authorization: Token secret123456"

curl http://localhost:3000/kinds -v -I -H "Accept: application/vnd.api+json" -H "Authorization: Token secret123456"

```

## Authorization with devise

### Register with curl

```bash

curl http://localhost:3000/auth -X POST -H "Accept: application/vnd.api+json" -H "Content-Type: application/json" -d '{ "email": "alanlogin@empresa.corp", "password": "12345678", "password_confirmation": "12345678" }' 
#
# Result from command curl
# {"status":"success","data":{"email":"alanlogin@empresa.corp","uid":"alanlogin@empresa.corp","id":1,"provider":"email","allow_password_change":false,"name":null,"nickname":null,"image":null,"created_at":"2021-06-06T13:04:28.277Z","updated_at":"2021-06-06T13:04:28.480Z","type":"user"}}%

```

### Login with curl

```bash

curl http://localhost:3000/auth/sign_in -X POST -H "Accept: application/vnd.api+json" -H "Content-Type: application/json" -d '{ "email": "alanlogin@empresa.corp", "password": "12345678" }'
#
# Result from command curl
# {"data":{"email":"alanlogin@empresa.corp","uid":"alanlogin@empresa.corp","id":1,"provider":"email","allow_password_change":false,"name":null,"nickname":null,"image":null,"type":"user"}}% 

```

### Orther url

```bash
curl http://localhost:3000/kinds -H "Accept: application/vnd.api+json"
#
#
# {"errors":["Para continuar, faça login ou registre-se."]}%

# Use -i and -v on sign_in
curl http://localhost:3000/auth/sign_in -i -v -X POST -H "Accept: application/vnd.api+json" -H "Content-Type: application/json" -d '{ "email": "alanlogin@empresa.corp", "password": "12345678" }'

# Use on header access-token, client, uid and too option -v

curl http://localhost:3000/kinds -H "Accept: application/vnd.api+json" -H "access-token: 66x5vOVQshrpPIuUUOp8cA" -H "client: chgwxR-fFXfvjRd53MbsVQ" -H "uid: alanlogin@empresa.corp" -v

*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 3000 (#0)
> GET /kinds HTTP/1.1
> Host: localhost:3000
> User-Agent: curl/7.64.1
> Accept: application/vnd.api+json
> access-token: 66x5vOVQshrpPIuUUOp8cA
> client: chgwxR-fFXfvjRd53MbsVQ
> uid: alanlogin@empresa.corp
> 
< HTTP/1.1 200 OK
< X-Frame-Options: SAMEORIGIN
< X-XSS-Protection: 1; mode=block
< X-Content-Type-Options: nosniff
< X-Download-Options: noopen
< X-Permitted-Cross-Domain-Policies: none
< Referrer-Policy: strict-origin-when-cross-origin
< Content-Type: application/vnd.api+json; charset=utf-8
< Vary: Accept, Origin
< access-token: 0ZpcTagQBtujJ8bMISw4oQ
< token-type: Bearer
< client: chgwxR-fFXfvjRd53MbsVQ
< expiry: 1624196424
< uid: alanlogin@empresa.corp
< ETag: W/"03d9aa24cc1f04b7fcea4e30d530f73c"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 22834807-98bf-44c4-8458-0aefe43cafbe
< X-Runtime: 0.289410
< Transfer-Encoding: chunked
< 
* Connection #0 to host localhost left intact
{"data":[{"id":"1","type":"kinds","attributes":{"description":"Friend"}},{"id":"2","type":"kinds","attributes":{"description":"Commercial"}},{"id":"3","type":"kinds","attributes":{"description":"Known"}}]}* Closing connection 0

```

### You saw that the token return data are different

You saw that the token return data are different and if you look at the terminal, an update has occurred.

```bash
10:40:24 web.1  |   User Update (0.5ms)  UPDATE "users" SET "tokens" =?, "updated_at" = ? WHERE "users"."id" = ? ...

```




---
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
