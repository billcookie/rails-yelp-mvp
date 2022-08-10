require 'faker'

puts 'Cleaning the DB.....'

Restaurant.destroy_all

puts 'Creating amazin restaurants....'

35.times do
  Restaurant.create!(
    name: Faker::Movies::StarWars.unique.planet,
    address: Faker::Address.unique.full_address,
    phone_number: Faker::PhoneNumber.unique.phone_number_with_country_code,
    category: Restaurant::CATEGORY.sample
  )
end

Restaurant.all.each do |restaurant|
  rand(0..12).times do
    Review.create!(
      content: Faker::Restaurant.review.split(".").first + ".",
      rating: rand(0..5),
      restaurant_id: restaurant.id
    )
  end
end

puts "....... Look at these bad boy restaurants"
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
