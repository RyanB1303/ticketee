FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password {"password12345"}
    trait :admin do
      admin { true }
    end
  end
end