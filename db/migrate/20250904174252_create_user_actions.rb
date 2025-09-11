# frozen_string_literal: true

class CreateUserActions < ActiveRecord::Migration[8.0]
  def change
    create_table :user_actions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :action_type
      t.string :url

      t.timestamps
    end
  end
end
