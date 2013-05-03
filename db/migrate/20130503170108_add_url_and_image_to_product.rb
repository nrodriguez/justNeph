class AddUrlAndImageToProduct < ActiveRecord::Migration
  def change
    add_column :products, :url, :string
    add_column :products, :image, :string
  end
end
