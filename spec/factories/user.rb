FactoryBot.define do
  factory :user do
    name "John"
    email "user@example.com"
    password "password"
    role :user
  end

  factory :admin, class: User do
    name "Admin"
    email "admin@ex.com"
    password "password"
    role :admin
  end
end
