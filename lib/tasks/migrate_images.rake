# frozen_string_literal: true

namespace :app do
  desc 'Parse the folder, create a category and put image'
  task migrate_images: :environment do
    user = User.find_or_create_by(email: 'email@example.com')

    root_path = Rails.root.join('public/migrate_images')

    p "Directory #{root_path} does not exist. You need create it folder" unless Dir.exist?(root_path)

    Dir.entries(root_path).each do |folder_name|
      category_folder = File.join(root_path, folder_name)

      Dir.mkdir(category_folder) unless File.directory?(category_folder)

      new_category = Category.find_or_create_by(category_name: folder_name) do |category|
        category.description = folder_name
        category.user = user
      end
      p "Created #{folder_name} category"

      Dir.entries(category_folder).each do |file_name|
        image_file = File.join(category_folder, file_name)

        next unless File.join(image_file) && file_name =~ /\.(jpeg|png|jpg)\z/i

        image = Image.new(
          title: File.basename(file_name),
          category: new_category,
          user: user,
          image: File.open(image_file)
        )
        if image.save
          p "Added #{image_file} to Category #{folder_name}"
        else
          p "Failed to save Image #{file_name}"
        end
      end
    end
    p 'Image migration completed'
  end
end
