# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :category_name

      t.timestamps
    end

    add_index :categories, :category_name, unique: true
  end
end
