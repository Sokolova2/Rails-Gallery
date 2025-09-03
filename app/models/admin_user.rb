# frozen_string_literal: true3

class AdminUser < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    %w[id id_value email encrypted_password created_at updated_at]
  end
end
