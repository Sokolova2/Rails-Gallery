# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    association :image
    association :user
    association :category
  end
end
