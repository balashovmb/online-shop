class Product < ActiveRecord::Base
  has_many :products_shops
  has_many :shops, through: :products_shops

  validates :name, :color, presence: true
  validates :item_number, :weight, :size, numericality: { greater_than: 0 }
end
