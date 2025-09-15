# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  subject { create(:subscriber, user: user, category: category) }

  describe 'validations' do
    it { expect(subject).to validate_uniqueness_of(:user_id).scoped_to(:category_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'methods' do
    context 'subscribed' do
      it 'check that user created category' do
        subject
        expect(category.subscribers.exists?(user_id: user.id)).to be true
      end
    end
  end
end
