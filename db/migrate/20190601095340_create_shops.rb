class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :subway
      t.references :city, null: false


      t.timestamps null: false
    end
    add_index :shops, :city_id
  end
end
