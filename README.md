# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of practicing Rails by adding different functionalities through MVC framework and add tests to verify those functionalities are successfully implemented.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Screenshots

### Home page of Jungle:

![](https://github.com/jyxgao/jungle-rails/raw/master/docs/index.png?raw=true)

### Some Code Snippets:

![this is an example of a controller](https://github.com/97-Jeffrey/Jungle/blob/master/doc/Screen%20Shot%202020-09-22%20at%202.43.43%20PM.png?raw=true)

![this is an example of a model](https://github.com/97-Jeffrey/Jungle/blob/master/doc/Screen%20Shot%202020-09-22%20at%202.45.39%20PM.png?raw=true)

![this is an example of a view](https://github.com/97-Jeffrey/Jungle/blob/master/doc/Screen%20Shot%202020-09-22%20at%202.46.04%20PM.png?raw=true)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
