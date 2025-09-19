# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    sign_in user
  end

  describe 'POST /create' do
    subject { post :create, params: { user_id: user.id, category_id: category.id } }

    it 'return successfully created subscriber' do
      expect { subject }.to change(Subscriber, :count).by(1)
      expect(response).to redirect_to(categories_path)
    end
  end

  describe 'DELETE /destroy' do
    let!(:subscriber) { create(:subscriber, user: user, category: category) }
    subject(:delete_subscriber) {  delete :destroy, params: { category_id: category.id, id: subscriber.id } }

    it 'return successfully destroyed' do
      expect do
        subject
      end.to change(Subscriber, :count).by(-1)
    end
  end
end
