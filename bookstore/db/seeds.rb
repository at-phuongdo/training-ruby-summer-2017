# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 50.times do 
# 	email = Faker::Internet.email
# 	User.create(
# 		user_name: Faker::Internet.user_name,
# 		email: email,
# 		password: '12345',
# 		name: Faker::Name.name,
# 		provider: 'email',
# 		gender: rand(0..2),
# 		birthday: Faker::Date.birthday(18,65),
# 		uid: email
# 		)
# end


# 300.times do
# 	Book.create(
# 		name: Faker::Book.title,
# 		title: Faker::Book.title,
# 		author: Faker::Book.author,
# 		isn: Faker::Number.number(10)
# 		)
# end

# 30.times do
# 	Cart.create(user_id: User.all.ids[rand(User.count)])
# 	# random id theo id cu User
# end
# 40.times do
# 	Order.create(cart_id: Cart.all.ids[rand(Cart.count)], book_id: Book.all.ids[rand(Book.count)])
# end


# 300.times do |i| 
# 	Book.destroy(i+301)   
# end
