FactoryBot.define do
  factory :feedback do
    name Faker::Name.name
    email Faker::Internet.email
    text Faker::Lorem.sentences(3)
  end
end
