# frozen_string_literal: true

class AddAvatarToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :avatar, :string
  end
end
