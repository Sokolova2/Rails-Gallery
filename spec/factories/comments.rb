# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    comment { 'it so cute' }
    association :user
    association :category
    association :image
  end
end
