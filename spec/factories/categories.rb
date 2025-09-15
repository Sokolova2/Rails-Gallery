# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    category_name { 'lizards' }
    slug { category_name.parameterize }
    association :user
  end
end
