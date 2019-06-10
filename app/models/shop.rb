class Shop < ActiveRecord::Base
  belongs_to :city
  has_many :products_shops
  has_many :products, through: :products_shops

  validates :name, :address, :city, presence: true
end
