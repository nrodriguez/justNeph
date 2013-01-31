class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.integer :product_id

      t.timestamps
    end
  end
end
