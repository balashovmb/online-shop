class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :item_number, null: false
      t.string :name, null: false
      t.integer :weight, null: false
      t.integer :size, null: false
      t.string :color, null: false

      t.timestamps null: false
    end
  end
end
