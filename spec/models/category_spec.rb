# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  subject { create(:category, user: user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:category_name) }
    it { is_expected.to validate_uniqueness_of(:category_name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:images).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:subscribers).dependent(:destroy) }
  end
end
