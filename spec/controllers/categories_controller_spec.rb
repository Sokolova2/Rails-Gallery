# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  before do
    allow(controller).to receive(:set_locale)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    sign_in user
  end

  describe 'GET /index' do
    subject(:get_index) { get :index }

    it 'return all categories' do
      subject
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    subject(:get_show) { get :show, params: { id: category.id } }

    before do
      create_list(:image, 11, category: category)
      get_show
    end

    it 'return show category' do
      expect(assigns(:category)).to eq category
      expect(response).to have_http_status(:success)
    end

    it 'paginates images' do
      expect(assigns(:image).size).to eq(10)
    end
  end

  describe 'POST /create' do
    subject { post :create, params: { category: attributes_for(:category) } }

    it 'create a new category' do
      expect { subject }.to change(Category, :count).by(1)
      expect(response).to redirect_to(Category.last)
    end
  end

  describe 'PATCH /update' do
    subject(:update_category) { patch :update, params: { id: category.id, category: { category_name: 'lizards1' } } }

    it 'update category' do
      subject
      expect { category.reload.category_name }.to change(category, :category_name)
    end
  end

  describe 'DELETE /destroy' do
    let!(:category) { create(:category, user: user) }
    subject(:delete_category) { delete :destroy, params: { id: category.to_param } }

    it 'destroy category' do
      expect do
        subject
      end.to change(Category, :count).by(-1)
    end
  end
end
