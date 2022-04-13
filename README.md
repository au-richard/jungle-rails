# Jungle

A mini e-commerce application utilizing Rails for client - server requests.

## Final Product

!["This is the Jungle Homepage."](https://github.com/au-richard/jungle-rails/blob/master/docs/homepage.png)

!["This is the product detail page."](https://github.com/au-richard/jungle-rails/blob/master/docs/product_detail_page.png)

!["This is the cart checkout page."](https://github.com/au-richard/jungle-rails/blob/master/docs/cart_checkout_page.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Sass-Rails ~> 5.0.x
* Bootstrap-Sass ~> 3.3.6
* Uglifier >= 1.3.0
* jQuery-Rails
* Turbolinks
* Jbuilder ~> 2.0.x
* Sdoc ~> 0.4.0
* Bcrypt ~> 3.1.7
* Puma 
* Font-Awesome-Rails
* Money-Rails
* Carrierwave
* RMagick
* Faker
* Newrelic_rpm
* Rails_12factor

## Dev Dependencies

* Rspec-Rails ~> 3.5.x
* Byebug
* Quiet-Assets
* Dotenv-Rails
* Web-Console ~> 2.0.x
* Spring

## Testing

* Capybara
* Poltergeist
* Database_Cleaner

