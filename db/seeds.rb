

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

 User.delete_all
 Gossip.delete_all
 City.delete_all
10.times do |i|
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
 end 

#  t.string :first_name
#  t.string :last_name
#  t.string :email
#  t.integer :age
#  t.text :descryption
#  t.references :city, index: true
#  t.timestamps

10.times do |i|
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email:Faker::Internet.email  ,age: rand(20..30) , descryption: Faker::HitchhikersGuideToTheGalaxy.marvin_quote, city: City.all.sample)
  #Gossip.create(content: Faker::Name.first_name)
end

10.times do
  gossip = Gossip.create(title: Faker::HitchhikersGuideToTheGalaxy.location , content: Faker::HarryPotter.quote, user: User.all.sample)
 end



puts "created 10 user "