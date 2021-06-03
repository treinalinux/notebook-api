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
