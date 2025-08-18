# frozen_string_literal: true

class AddImageToCategory < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :image, :string
  end
end
