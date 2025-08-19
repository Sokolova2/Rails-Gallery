# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :image
  belongs_to :user
  belongs_to :category
  validates :user_id, uniqueness: { scope: :image_id }
end
