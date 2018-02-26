require 'faker'

FactoryBot.define do
  factory :job do
    date Faker::Date.between(2.years.ago, Date.today)
    client Faker::Hipster.sentence(2)
    description Faker::Hipster.paragraph
    location Faker::Hipster.sentence(2)
    amount Faker::Number.decimal(2)
    paid false
    notes Faker::Hipster.paragraph
  end
end
