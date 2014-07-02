# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
for ix in 1..50
  providers = Provider.create(email: 'tp' + ix.to_s + '@mail.com', \
    password: 'testtest', \
    first_name: 'Test', \
    last_name: 'Provider' + ix.to_s, birthdate: Date.new(1977, 8, 9), \
    zip: '23452', bypass_humanizer: true)
    
  ratings = Rating.create(provider_id: providers.id, rating: ix % 5 + 1)
  users = User.create(email: 'tu' + ix.to_s + '@mail.com', \
    password: 'testtest', \
    first_name: 'Test', \
    last_name: 'User' + ix.to_s, birthdate: Date.new(1977, 8, 9), \
    zip: '23454', bypass_humanizer: true)
  reviews = Review.create(provider_id: providers.id, user_id: users.id, review: 'Good' + ix.to_s)
end

if providers.errors.blank?
    puts "***providers seeding completed with no errors***"
    
else
    puts "providers seeding failed due to below reasons:"
    providers.errors.each do |x, y|
       puts"#{x} #{y}" # x will be the field name and y will be the error on it
     end
end

if ratings.errors.blank?
    puts "***ratings seeding completed with no errors***"
    
else
    puts "ratings seeding failed due to below reasons:"
    ratings.errors.each do |x, y|
       puts"#{x} #{y}" # x will be the field name and y will be the error on it
     end
end

if users.errors.blank?
    puts "***users seeding completed with no errors***"
    
else
    puts "users seeding failed due to below reasons:"
    users.errors.each do |x, y|
       puts"#{x} #{y}" # x will be the field name and y will be the error on it
     end
end
