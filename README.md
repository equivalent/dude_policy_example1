# README

This is an example application for [DudePolicy](https://github.com/equivalent/dude_policy) gem

You can try it out at [https://dude-policy-example1.herokuapp.com](https://dude-policy-example1.herokuapp.com)

login details

**admin**

u: `admin@admin.com`
p: `password`

**user**

u: `user@user.com`
p: `password`

> the website is for education purpouses, please be nice :pray:

### Important files

Conf

* [Gemfile](https://github.com/equivalent/dude_policy_example1/blob/master/Gemfile#L51)

Models

* [Article model](https://github.com/equivalent/dude_policy_example1/blob/master/app/models/article.rb)
* [User model](https://github.com/equivalent/dude_policy_example1/blob/master/app/models/user.rb)

Policy

* [Article policy](https://github.com/equivalent/dude_policy_example1/blob/master/app/policy/article_policy.rb)
* [User policy](https://github.com/equivalent/dude_policy_example1/blob/master/app/policy/user_policy.rb)

Controllers

* [Application controller](https://github.com/equivalent/dude_policy_example1/blob/master/app/controllers/application_controller.rb#L16)
* [Articles controller](https://github.com/equivalent/dude_policy_example1/blob/master/app/controllers/articles_controller.rb#L47)
* [Users controller](https://github.com/equivalent/dude_policy_example1/blob/master/app/controllers/users_controller.rb#L7)

Views

* [articles/index](https://github.com/equivalent/dude_policy_example1/blob/master/app/views/articles/index.html.erb#L24)

Business logic

* [helper](https://github.com/equivalent/dude_policy_example1/blob/master/app/helpers/application_helper.rb#L4)

### Run on localhost

```
git clone git@github.com:equivalent/dude_policy_example1.git
cd dude_policy_example1
gem install bundler
bundle install
rails db:migrate
rails db:seed
```


### about Rails


using Ruby on Rails version 6.0.2.2

I use [Devise](https://github.com/heartcombo/devise) for `Authentication` (login user in) but
[DudePolicy](https://github.com/equivalent/dude_policy) is independent
=> you can use any solution to log in users 


generated with

```ruby
rails  new --skip-bootsnap --skip-turbolinks --skip-javascript --skip-sprockets --skip-action-cable --skip-test --skip-system-test --skip-action-mailer --skip-action-mailbox --skip-action-text  dude_policy_example1
rails g scaffold Article title:string  body:text author_id:integer secret_note:string
rails g scaffold User name:string admin:boolean

rails db:migrate

devise:install
```


