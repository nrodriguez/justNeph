class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.float :price
      t.boolean :active
      t.string :site
      t.timestamps
    end
  end
end
