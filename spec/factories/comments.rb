# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'it so cute' }
    association :user
    association :category
    association :image
  end
end
