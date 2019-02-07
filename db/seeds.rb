
 require 'faker'

 User.delete_all
 Gossip.delete_all
 City.delete_all


10.times do |i|
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
 end 

10.times do |i|
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email:Faker::Internet.email  ,age: rand(20..30) , description: Faker::HitchhikersGuideToTheGalaxy.marvin_quote, city: City.all.sample)
  #Gossip.create(content: Faker::Name.first_name)
end

10.times do |i|
  gossip = Gossip.create(title: Faker::HitchhikersGuideToTheGalaxy.location , content: Faker::HarryPotter.quote, user: User.all.sample)
end




puts "created 10 user "