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

  scope :order_by_likes_and_comments, lambda {
    select('categories.*, count(likes.id) as likes_count, count(comments.id) as comments_count')
      .left_joins(:likes, :comments)
      .group('categories.id')
      .order('likes_count desc, comments_count desc')
      .limit(5)
  }

  def subscribe?(user)
    subscribers.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id id_value user_id category_name created_at updated_at slug]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[comments subscribers images likes user]
  end
end
