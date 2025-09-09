# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  validates :category_name, uniqueness: true, presence: true

  friendly_id :category_name, use: :slugged

  def subscribe?(user)
    subscribers.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id id_value user_id category_name created_at updated_at slug]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[comments subscribers images likes user]
  end
end
