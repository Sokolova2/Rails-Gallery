# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  # describe 'validations' do
  #
  # end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:images).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:subscribers).dependent(:destroy) }
  end
end
