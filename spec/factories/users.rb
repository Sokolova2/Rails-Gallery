# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@test' }
    password { '123123' }
    password_confirmation { '123123' }
    language { 'en' }
  end
end
