# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "remove old"
User.delete_all
Post.delete_all
Category.delete_all
Comment.delete_all
Tag.delete_all
puts "Old data has been terminated!"

MULTIPLIER=1
puts "Creating Users..."
(MULTIPLIER * 10).times do
  fname =  Faker::Name.first_name
  User.create(name: fname)
end

puts "Creating Categories"
CATEGORIES=["Shoes","Appliances","Hats","Shirts","Pants","Electronics"]
puts "Create Categories"
CATEGORIES.each do |category|
  Category.create(name: category)
end

categories=Category.all
puts "Creating Posts"
(MULTIPLIER * 10).times do
 p=Post.new
 p.title= Faker::Lorem.sentence
 p.body= Faker::Lorem.paragraph
 p.category_id=categories.sample.id
 p.save
end

posts=Post.all
authors=User.all
puts "Creating comments"
(MULTIPLIER * 20).times do
 c=Comment.new
 c.body= Faker::Lorem.paragraph[1..50]
 c.post_id=posts.sample.id
 c.author_id=authors.sample.id
 c.save
end

puts "Creating UserPost"
(MULTIPLIER * 10).times do
 up=UserPost.new
 up.user_id= User.all.sample.id
 up.post_id= Post.all.sample.id
 up.save
end






