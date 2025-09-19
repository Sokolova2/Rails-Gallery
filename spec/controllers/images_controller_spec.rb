# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:image) { create(:image, category: category) }
  let(:like) { create(:like, user: user, category: category, image: image) }
  let(:comment) { create(:comment, user: user, category: category, image: image) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    sign_in user
  end

  describe 'GET /show' do
    subject(:get_show) { get :show, params: { category_id: category.id, id: image.id } }

    it 'return likes and comments of image' do
      subject
      expect(assigns(:like)).to eq Like.find_by(image_id: image.id)
      expect(assigns(:comment)).to eq Comment.find_by(image_id: image.id)
    end
  end

  describe 'POST /create' do
    let(:image_file) { fixture_file_upload(Rails.root.join('app/assets/images/avatar.png'), 'avatar.png') }
    subject { post :create, params: { category_id: category.id, image: { image: image_file } } }

    it 'return successfully created image' do
      expect { subject }.to change(Image, :count).by(1)
      expect(response).to redirect_to(Category.find(category.id))
    end
  end
end
