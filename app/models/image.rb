# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :image, presence: true

  after_create :send_image_email

  mount_uploader :image, ImageUploader

  def liked?(user)
    likes.exists?(user_id: user.id)
  end

  def send_image_email
    category.subscribers.includes(:user).find_each do |subscriber|
      user = subscriber.user
      next unless user

      UserMailer.add_image_email(category, user).deliver_now
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id id_value category_id image created_at updated_at slug]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category comments likes]
  end
end
