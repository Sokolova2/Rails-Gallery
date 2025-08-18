class Image < ApplicationRecord
  belongs_to :category
  has_many :likes
  has_many :comments, dependent: :destroy

  def liked?(user)
    likes.exists?(user_id: user.id)
  end

  mount_uploader :images, ImageUploader
end
