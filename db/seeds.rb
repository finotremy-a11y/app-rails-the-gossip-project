# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts "Cleaning database..."
Like.destroy_all
Comment.destroy_all
MessageRecipient.destroy_all
PrivateMessage.destroy_all
GossipTag.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

puts "Creating cities..."
cities = 10.times.map do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

puts "Creating users..."
users = 10.times.map do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(18..80),
    city: cities.sample
  )
end

puts "Creating gossips..."
gossips = 20.times.map do
  Gossip.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph,
    user: users.sample
  )
end

puts "Creating tags..."
tags = 10.times.map do
  Tag.create(title: Faker::Lorem.word)
end

puts "Linking tags to gossips..."
gossips.each do |g|
  GossipTag.create(gossip: g, tag: tags.sample)
end

puts "Creating private messages..."
5.times do
  sender = users.sample
  pm = PrivateMessage.create(
    content: Faker::Lorem.sentence,
    sender: sender
  )
  rand(1..3).times do
    MessageRecipient.create(
      private_message: pm,
      recipient: users.reject { |u| u == sender }.sample
    )
  end
end

puts "Creating comments..."
comments = 20.times.map do
  Comment.create(
    content: Faker::Lorem.sentence,
    user: users.sample,
    commentable: gossips.sample
  )
end

puts "Creating likes..."
20.times do
  user = users.sample
  likeable = (gossips + comments).sample
  Like.create(user: user, likeable: likeable)
end

puts "Creating comments..."
comments = []

20.times do
  comments << Comment.create(
    content: Faker::Lorem.sentence,
    user: users.sample,
    commentable: gossips.sample
  )
end

puts "Creating nested comments..."
10.times do
  Comment.create(
    content: Faker::Lorem.sentence,
    user: users.sample,
    commentable: comments.sample
  )
end

puts "Done! 🌱"