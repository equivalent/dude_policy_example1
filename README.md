# README

This is an example application for [DudePolicy](https://github.com/equivalent/dude_policy) gem


```
git clone git@github.com:equivalent/dude_policy_example1.git
cd dude_policy_example1
gem install bundler
bundle install
rails db:migrate
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


