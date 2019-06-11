require 'rails_helper'

RSpec.describe Shop, type: :model do
  context 'validations' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:name) }
  end
end
