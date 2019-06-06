class ProductsShop < ActiveRecord::Base
  belongs_to :shop
  belongs_to :product

  validates :cost, :quantity, numericality: {greater_than: 0}

  PROPS = {
           product_name: "Название товара",
           cost: "Цена",
           city: "Город",
           adress: "Адрес",
           subway: "Метро",
           size: "Размер",
           weight: "Вес"
          }.freeze
end