# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
for ix in 1..50
  

  admin = Provider.create(email: 'tp' + ix.to_s + '@mail.com', password: 'testtest', sign_in_count: 0, created_at: DateTime.current, first_name: 'Test', last_name: 'Provider' + ix.to_s, birthdate: Date.new(1977, 8, 9), zip: '23452')
end

if admin.errors.blank?
    puts "***User #{admin.first_name} #{admin.last_name} created ***"
    admin.add_role :admin # add_role is method defined by rolify gem
    puts "***admin role assigned to #{admin.first_name} #{admin.last_name}***"
else
    puts "admin user failed to create due to below reasons:"
    admin.errors.each do |x, y|
       puts"#{x} #{y}" # x will be the field name and y will be the error on it
     end
end
