# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
