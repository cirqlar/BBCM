# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(name: "Ayanfe", email: "ayanfe@naude.com", password: "123#456_", password_confirmation: "123#456_")
Admin.create!(name: "Tolu", email: "tolu@naude.com", password: "123#456_", password_confirmation: "123#456_")
Admin.create!(name: "Ugo", email: "ugo@naude.com", password: "123#456_", password_confirmation: "123#456_")

3.times do |x|
  9.times do |y|
    yuser = Admin.create!(parent_id: x + 1, name: "Test #{x} #{y}", email: "testemail#{x}#{y}@yahoo.com", password: "123#456_", password_confirmation: "123#456_")
    9.times do |z|
      Admin.create!(parent_id: yuser.id, name: "Test #{x} #{y} #{z}", email: "testemail#{x}#{y}#{z}@yahoo.com", password: "123#456_", password_confirmation: "123#456_")
    end
  end
end



100.times do |x|
  Subscriber.create!(name: "jamey", email: "what#{x}@yahoo.com")
end
