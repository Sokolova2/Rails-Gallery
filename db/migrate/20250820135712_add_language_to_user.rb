# frozen_string_literal: true

class AddLanguageToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :language, :string
  end
end
