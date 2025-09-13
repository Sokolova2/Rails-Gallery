# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(email: 'test@test', password: '123123', password_confirmation: '123123', avatar: '123') }

  describe 'associations' do
    it { is_expected.to have_many(:categories).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:subscribers).dependent(:destroy) }
  end

  describe 'methods' do
    context 'set_default_language' do
      let(:default_language) { I18n.locale.to_s }

      it 'sets default language as I18n locale' do
        # expect { subject.set_default_language }.not_to change(subject, :language)
        expect(subject.set_default_language).to eq(default_language)
      end
    end
  end
end
