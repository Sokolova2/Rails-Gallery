# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  validate :category_name_must_be_present
  validates :category_name, uniqueness: true

  friendly_id :category_name, use: :slugged

  def subscribe?(user)
    subscribers.exists?(user_id: user.id)
  end

  def category_name_must_be_present
    unless category_name.present?
      errors.add(:base, "Name category must be present")
    end
  end
end
