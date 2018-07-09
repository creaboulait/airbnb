# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
user = {}
user['password'] = 'asdf'
# user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  3.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  20.times do 
    listing['description'] = Faker::Hipster.sentence
    listing['price'] = rand(80..500)

    listing['area'] = Faker::Address.city
    listing['place_type'] = ["Entire House", "Private Room", "Shared Room"].sample
    listing['house_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['up_to_guests_num'] = rand(1..10)
    listing['bedrooms_num'] = rand(0..5)
    listing['beds_num'] = rand(1..6)
    listing['bathrooms_num'] = rand(1..3)
    
    listing['country'] = Faker::Address.country
    listing['state'] = Faker::Address.state
    listing['city'] = Faker::Address.city
    listing['zipcode'] = Faker::Address.zip_code
    listing['address'] = Faker::Address.street_address

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end

