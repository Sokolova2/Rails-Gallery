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
    it 'return all categories' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    before { create_list(:image, 11, category: category) }

    it 'return show category' do
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq category
      expect(response).to have_http_status(:success)
    end

    it 'paginates images' do
      get :show, params: { id: category.id }
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

  describe 'PATCH/update' do
    subject { patch :update, params: { id: category.id, category: {category_name: 'lizards1'} } }
    it 'update category' do
      expect { subject }.to change { category.reload.category_name }
    end
  end

  # describe 'DELETE/destroy' do
  #   subject { delete :destroy, params: { id: category.id } }
  #
  #   it 'destroy category' do
  #     subject
  #     expect { subject }.to change(Category, :count).by(-1)
  #   end
  # end
end
