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

  after_create :send_image_email

  def send_image_email
    category.subscribers.includes(:user).each do |subscriber|
      user = subscriber.user
      next unless user

      UserMailer.image_email(category, user).deliver_later
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id id_value category_id image created_at updated_at slug]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category comments likes]
  end
end
