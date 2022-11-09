FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 123456 }
    first_name { 'User' }
    last_name { 'Userovich' }
  end

  trait :seller do
    buyer { false }
    seller { true }
  end
end
