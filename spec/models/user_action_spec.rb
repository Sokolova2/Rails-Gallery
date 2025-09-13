# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserAction, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:action_type) }
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
