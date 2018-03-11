FactoryBot.define do
  pw = Faker::Internet.password(8)

  factory :user do
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
  end
end
