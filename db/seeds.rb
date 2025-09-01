# frozen_string_literal: true

user = User.find_by(first_name: 'default')
cat_category = Category.find_by(slug: 'cats')

images = Image.where(category: cat_category)

content_comments = ["it's perfect", 'so pretty', 'so beautiful!!!', 'cuteeee!!!', 'cool', 'like this']

images.each do |image|
  image.likes.create(user: user, category: cat_category)
  content_comments.each do |comment|
    image.comments.create(user: user, category: cat_category, comment: comment, created_at: '2025-08-26')
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?