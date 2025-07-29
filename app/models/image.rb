class Image < ApplicationRecord
  belongs_to :category
  mount_uploader :images, ImageUploader
end
