# frozen_string_literal: true

namespace :app do
  desc 'Parse the folder, create a category and put image'
  task :migrate_images => :environment do
    default_user = User.find_or_create_by!(email: 'email@example.com') do |user|
      user.first_name = 'default'
      user.last_name = 'default'
      user.password = '123456'
    end

    root_path = Rails.root.join('public', 'migrate_images')

    unless Dir.exist?(root_path)
      p "Does not exist: #{root_path}"
      return
    end

    Dir.entries(root_path).each do |name_folder|
      next if name_folder.start_with?('.')

      category = File.join(root_path, name_folder)

      new_category = Category.find_or_create_by!(category_name: name_folder) do |new_category|
        new_category.user = default_user
      end
      p "Created #{new_category.category_name}"

      Dir.entries(category).each do |file|
        next if file.start_with?('.')
        image = File.join(category, file)

        image = Image.new(
          category: new_category,
          image: File.open(image)
        )

        if image.save
          p "Added image to category: #{name_folder}"
        else
          p "Failed to add image to category: #{name_folder}"
        end
      end
    end
    p "Image migration completed"
  end
end
