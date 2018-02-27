# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Job.create!(
    date: Faker::Date.between(2.years.ago, Date.today),
    client: Faker::Hipster.sentence(2),
    description: Faker::Hipster.paragraph,
    location: Faker::Hipster.sentence(2),
    amount: Faker::Number.decimal(2),
    paid: false,
    notes: Faker::Hipster.paragraph
  )
end

puts "#{Job.count} jobs created."