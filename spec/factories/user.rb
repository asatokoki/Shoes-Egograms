FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:5) }
    job { Faker::Lorem.characters(number:20) }
  end
end