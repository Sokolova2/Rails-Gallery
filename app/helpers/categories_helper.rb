# frozen_string_literal: true

module CategoriesHelper
  def preview_category(category, options = { size: 300 })
    size = options[:size]
    if category.images.any?
      image_tag category.images.first.image.url, size: size, class: 'image-preview rounded-4'
    else
      image_tag 'preview.png', size: size, class: 'image-preview rounded-4'
    end
  end
end
