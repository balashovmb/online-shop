class Shop < ActiveRecord::Base
  has_many :products_shops
  has_many :products, through: :products_shops

  validates :name, :address, :city, presence: true
end
