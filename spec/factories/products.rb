FactoryBot.define do
  factory :product do
    title { 'Stels' }
    article { 12345 }
    description { "velosiped" }
    price { 12.5 }
  end

  trait :invalid do
    title { nil }
  end
end
