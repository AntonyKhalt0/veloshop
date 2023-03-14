# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { 'Stels' }
    article { 12_345 }
    description { 'velosiped' }
    price { 12.5 }
  end

  trait :invalid do
    title { nil }
  end
end
