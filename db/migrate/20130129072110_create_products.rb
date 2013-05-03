class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.float :price
      t.boolean :active
      t.integer :merchant_id
      t.string :unique_id
      t.timestamps
    end
  end
end
