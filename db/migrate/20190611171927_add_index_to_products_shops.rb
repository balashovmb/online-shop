class AddIndexToProductsShops < ActiveRecord::Migration
  def change
    add_index :products_shops, :shop_id    
  end
end
