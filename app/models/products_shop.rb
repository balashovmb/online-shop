class ProductsShop < ActiveRecord::Base
  belongs_to :shop
  belongs_to :product

  validates :cost, :quantity, numericality: {greater_than: 0}
end
