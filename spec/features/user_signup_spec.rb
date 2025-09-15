# frozen_string_literal: true

require 'rails_helper'

Rspec.feature 'Sign up', type: :features do
  before do
    Capybara.current_driver = :selenium_chrome
  end

  after do
    Capybara.use_default_driver
  end

  it 'a new user can sign up' do
    visit 'users/sign_up'
    fill_in 'Email', with: 'test@example'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
