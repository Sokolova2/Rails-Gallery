# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image
  belongs_to :category

  def self.ransackable_attributes(_auth_object = nil)
    %w[id id_value category_id image_id user_id comment created_at updated_at slug]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category image user]
  end
end
