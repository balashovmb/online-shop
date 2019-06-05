require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:color)}
    it {should validate_numericality_of(:weight).is_greater_than(0) }
  end
end
