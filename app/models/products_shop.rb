class ProductsShop < ActiveRecord::Base
  belongs_to :shop
  belongs_to :product

  validates :cost, :quantity, numericality: {greater_than: 0}

  PROPS = [
           :product_name,
           :cost,
           :city,
           :adress,
           :subway,
           :size,
           :weight
          ].freeze
end