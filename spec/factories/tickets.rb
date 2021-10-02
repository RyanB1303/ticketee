FactoryBot.define do
  factory :ticket do
    name {"Example Ticket"}
    description {"Example Ticket Description"}
    association :author, factory: :user
  end
end