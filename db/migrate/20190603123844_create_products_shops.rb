class CreateProductsShops < ActiveRecord::Migration
  def change
    create_table :products_shops do |t|
      t.references :product
      t.references :shop
      t.float :cost
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
