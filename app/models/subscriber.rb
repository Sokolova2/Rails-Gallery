# frozen_string_literal: true

class Subscriber < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :user_id, uniqueness: { scope: :category_id }

  after_create :send_subscribe_email

  def send_subscribe_email
    UserMailer.subscribe_email(user).deliver_later
  end
end
