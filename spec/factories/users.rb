FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    photo { 'john.jpg' }
    posts_counter { 5 }
  end
end
