# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  validate :category_name_must_be_present

  def subscribe?(user)
    subscribers.exists?(user_id: user.id)
  end

  def category_name_must_be_present
    unless category_name.present?
      errors.add(:base, "Name category must be present")
    end
  end
end
