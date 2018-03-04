FactoryBot.define do
  factory :expense do
    name Faker::Coffee.blend_name
    amount Faker::Number.decimal(2)
    date Faker::Date.between(2.years.ago, Date.today)
    category ["travel", "misc", "supplies"].sample
    job
  end
end
