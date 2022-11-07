# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { 'MyString' }
  end

  trait :invalid_category do
    title { nil }
  end
end
