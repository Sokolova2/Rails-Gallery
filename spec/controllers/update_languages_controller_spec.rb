# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateLanguagesController, type: :controller do
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    sign_in user
  end

  describe 'PATCH /update' do
    it 'return successfully change language of user' do
      patch :update, params: { language: 'ru' }
      expect { user.reload.language }.to change(user, :language)
      expect(response).to redirect_to(categories_path)
    end
  end
end
