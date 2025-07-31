module CategoriesHelper
  def preview_category(category, options = { size: 200 })
    size = options[:size]
    if category.images.any?
      image_tag category.images.first.images.url, size: size, class: "rounded-5"
    else
      image_tag "preview.png", size: size, class: "rounded-5"
    end
  end
end
