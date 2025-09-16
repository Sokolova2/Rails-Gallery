# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:image) { create(:image, category: category) }
  let(:comment) { create(:comment, user: user, category: category, image: image) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    sign_in user
  end

  describe 'POST /create' do
    subject do
      post :create, params: {
        category_id: category.id,
        image_id: image.id,
        comment: attributes_for(:comment)
      }
    end

    it 'check result creating comments' do
      expect { subject }.to change(Comment, :count).by(1)
      expect(response).to redirect_to(category_image_path(category, image))
      expect(Comment.last.user).to eq(user)
    end
  end
end
