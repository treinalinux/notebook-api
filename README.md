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
