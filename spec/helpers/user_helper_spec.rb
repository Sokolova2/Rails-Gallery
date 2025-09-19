# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserHelper, type: :helper do
  let(:user) { create(:user) }

  describe 'categories preview' do
    context 'when category have images' do
      it 'returns avatar of user' do
        expect(helper.avatar_for(user)).to include(user.avatar.identifier)
      end
    end

    context 'when category does not have images' do
      before do
        User.find(user.id).update(avatar: nil)
      end

      it 'returns preview image' do
        expect(helper.avatar_for(user)).to match(/avatar.*\.png/)
      end
    end
  end
end
