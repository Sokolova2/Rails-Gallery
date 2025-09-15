# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:image) { create(:image, category: category) }
  subject { create(:like, user: user, image: image, category: category) }

  describe 'validations' do
    it { expect(subject).to validate_uniqueness_of(:user_id).scoped_to(:image_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:image) }
  end

  describe 'methods' do
    context 'liked' do
      it 'check that user put like' do
        subject
        expect(image.likes.exists?(user_id: user.id)).to be true
      end
    end
  end
end
