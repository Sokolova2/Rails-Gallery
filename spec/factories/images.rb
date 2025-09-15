# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    image { File.open(Rails.root.join('app/assets/images/avatar.png').open) }
    association :category
  end
end
