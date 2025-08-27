# frozen_string_literal: true

module CategoriesHelper
  def preview_category(category)
    if category.images.any?
      image_tag category.images.first.image.url, class: 'image-preview rounded-4'
    else
      image_tag 'preview.png', class: 'image-preview rounded-4'
    end
  end
end
