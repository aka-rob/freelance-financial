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
    client: Faker::RuPaul.queen,
    description: Faker::Hipster.sentence,
    location: Faker::Address.city,
    amount: Faker::Number.decimal(2),
    paid: Faker::Boolean.boolean,
    notes: Faker::Hipster.sentence
  )
end

job_ids = Job.all.ids

50.times do
  Expense.create!(
    name: Faker::Coffee.blend_name,
    amount: Faker::Number.decimal(2),
    date: Faker::Date.between(2.years.ago, Date.today),
    category: ["travel", "misc", "supplies"].sample,
    job_id: job_ids.sample
  )

end

puts "#{Job.count} jobs created."
puts "#{Expense.count} expenses created."
