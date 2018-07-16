FactoryBot.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password
    role :user
  end

  factory :admin, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password
    role :admin
  end
end
