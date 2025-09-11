# frozen_string_literal: true

class UserAction < ApplicationRecord
  belongs_to :user

  validates :action_type, presence: true
  validates :url, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id id_value user_id action_type url created_at updated_at]
  end
end
