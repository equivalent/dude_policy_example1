# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
admin = User.create(name: 'Admin', email: 'admin@admin.com', password: 'password', password_confirmation: 'password', admin: true)
user = User.create(name: 'Regular User', email: 'user@user.com', password: 'password', password_confirmation: 'password')

Article.create!(title: 'article 1 by Admin', body: 'Lorem ipsum', author: admin)
Article.create!(title: 'article 2 by Admin', body: 'Lorem ipsum', author: admin)
Article.create!(title: 'article 1 by User', body: 'Lorem ipsum', author: user)
