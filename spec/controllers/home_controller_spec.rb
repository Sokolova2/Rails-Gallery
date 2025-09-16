# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    sign_in user
  end

  describe 'GET /index' do
    let(:category) { create(:category, user: user) }

    it 'returns category order by like and comments' do
      get :index
      expect(Category.order_by_likes_and_comments).to include(category)
    end
  end
end
