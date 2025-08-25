# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :image, presence: true

  def liked?(user)
    likes.exists?(user_id: user.id)
  end

  mount_uploader :image, ImageUploader
end
