FactoryBot.define do
  factory :post do
    title { 'My Post' }
    text { 'This is my post.' }
    association :user
  end
end
