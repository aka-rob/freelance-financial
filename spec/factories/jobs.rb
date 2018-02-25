FactoryBot.define do
  factory :job do
    date "2018-02-25"
    client "MyString"
    description "MyText"
    location "MyString"
    amount "9.99"
    paid false
    notes "MyText"
  end
end
