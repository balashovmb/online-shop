require "rails_helper"

describe ProductsShop::PrepareList do
  let!(:products_shop1) { create(:products_shop) }
  let!(:products_shop2) { create(:products_shop) }

  let(:subject) do
    described_class.call([Shop.first.id],[])
  end

  context "first" do
    it "prepares list" do
      expect (subject).to eq({})
    end
  end

end