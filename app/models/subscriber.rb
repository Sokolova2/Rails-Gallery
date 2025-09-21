# frozen_string_literal: true

class Subscriber < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :user_id, uniqueness: { scope: :category_id }

  after_create :send_subscribed_email

  def send_subscribed_email
    UserMailer.subscribed_email(user).deliver_now
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id id_value category_id user_id created_at updated_at slug]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category user]
  end
end
