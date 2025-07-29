class AddImageToImage < ActiveRecord::Migration[8.0]
  def change
    add_column :images, :images, :string
  end
end
