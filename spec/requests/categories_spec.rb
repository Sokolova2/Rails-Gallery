# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  before do
    sign_in user, scope: :user
  end

  describe 'GET /index' do
    it 'return all categories' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    before { create_list(:image, 11, category: category) }

    it 'return show category' do
      get :show, params: { id: category.id }
      expect(response.body).to include(category.category_name)
      expect(response).to have_http_status(:success)
    end

    it 'paginates images' do
      get :show, params: { id: category.id }
      expect(json_response.count).to eq(10)
    end
  end

  # describe 'POST /create' do
  #
  # end
  #
  # describe 'PATCH/update' do
  #
  # end
  #
  # describe 'DELETE /destroy' do
  #
  # end
end
