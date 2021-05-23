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
