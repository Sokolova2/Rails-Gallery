class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :image, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
