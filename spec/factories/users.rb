# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@test' }
    password { '123123' }
    password_confirmation { '123123' }
    avatar { File.open(Rails.root.join('app/assets/images/avatar.png').open) }
    language { 'en' }
  end
end
