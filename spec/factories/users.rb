# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 123_456 }
    first_name { 'User' }
    last_name { 'Userovich' }
  end
end
