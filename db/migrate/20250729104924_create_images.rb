class CreateImages < ActiveRecord::Migration[8.0]
  def change
    create_table :images do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.float :like

      t.timestamps
    end
  end
end
