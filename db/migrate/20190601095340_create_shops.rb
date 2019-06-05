class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :subway
      t.string :city, null: false

      t.timestamps null: false
    end
  end
end
