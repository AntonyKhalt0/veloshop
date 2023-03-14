# frozen_string_literal: true

FactoryBot.define do
  factory :seller do
    email { 'seller@example.com' }
    password { 123_456 }
    first_name { 'Seller' }
    last_name { 'Sellerovich' }
    type { 'Seller' }
  end
end
