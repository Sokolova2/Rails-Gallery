# frozen_string_literal: true

class Subscriber < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :user_id, uniqueness: { scope: :category_id }
end
