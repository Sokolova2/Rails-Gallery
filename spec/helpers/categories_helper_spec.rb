# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesHelper, type: :helper do
  let(:user) { create(:user) }
  let!(:category) { create(:category, user: user) }
  let!(:image) { create(:image, category: category) }
  let!(:image_second) { create(:image, category: category) }

  describe 'categories preview' do
    context 'when category have images' do
      it 'returns first image from category' do
        expect(helper.preview_category(category)).to include(category.images.first&.image&.identifier)
      end
    end

    context 'when category does not have images' do
      before do
        Image.destroy_all
      end

      it 'returns preview image' do
        expect(helper.preview_category(category)).to match(/preview.*\.png/)
      end
    end
  end
end
