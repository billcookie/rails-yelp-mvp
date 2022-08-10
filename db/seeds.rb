require 'faker'

puts 'Cleaning the DB.....'

Restaurant.destroy_all

puts 'Creating amazin restaurants....'

10.times do
  Restaurant.create!(
    name: Faker::Movies::StarWars.planet,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant::CATEGORY.sample
  )
end

puts "....... Look at these bad boy restaurants"
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
