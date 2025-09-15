# frozen_string_literal: true

FactoryBot.define do
  factory :subscriber do
    association :category
    association :user
  end
end
