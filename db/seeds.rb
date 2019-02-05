# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

 User.delete_all
 Gossip.delete_all
 City.delete_all
10.times do |i|
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
 end 

10.times do |i|
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
  #Gossip.create(content: Faker::Name.first_name)
end

10.times do
  gossip = Gossip.create(content: Faker::HarryPotter.quote,title: Faker::HitchhikersGuideToTheGalaxy.location ,user: User.all.sample)
 end



puts "created 10 user "