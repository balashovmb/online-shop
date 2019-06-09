require 'rails_helper'

RSpec.describe ProductsShop, type: :model do
  context 'validations' do
    it {should validate_presence_of(:shop)}
    it {should validate_presence_of(:product)}
    it {should validate_numericality_of(:cost).is_greater_than(0) }
    it {should validate_numericality_of(:quantity).is_greater_than(0) }
  end
end
