FactoryBot.define do
  factory :user_action do
    action_type { 'sign in' }
    url { Faker::Internet.url }
    association :user
  end
end