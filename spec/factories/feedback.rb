FactoryBot.define do
  factory :feedback do
    name "John Smith"
    email "john@example.com"
    text "Hello"
  end

  factory :another_feedback, class: Feedback do
    name "Michael Brown"
    email "misha@example.com"
    text "Help"
  end

  factory :random_feedback, class: Feedback do
    name Faker::Name.name
    email Faker::Internet.email
    text Faker::Lorem.sentences(3)
  end
end
