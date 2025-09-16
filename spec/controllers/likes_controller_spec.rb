# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: 'controller' do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:image) { create(:image, category: category) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    sign_in user
  end

  describe 'POST /create' do
    subject do
      post :create, params: {
        user_id: user.id,
        category_id: category.id,
        image_id: image.id,
        like: attributes_for(:like)
      }
    end

    it 'return successfully created like' do
      expect { subject }.to change(Like, :count).by(1)
      expect(response).to redirect_to(category_image_path(category, image))
    end
  end

  describe 'DELETE /destroy' do
    let!(:like) { create(:like, user: user, category: category, image: image) }

    it 'return successfully destroyed like' do
      expect do
        delete :destroy, params: { category_id: category.id, image_id: image.id, id: like.id }
      end.to change(Like, :count).by(-1)
    end
  end
end
