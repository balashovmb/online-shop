require "rails_helper"

describe ProductsShop::PrepareList do
  let!(:products_shop) { create(:products_shop) }

  let(:subject) do
    described_class.call([Shop.first.id],[])
  end

  context "first" do
    it "prepares list" do
      expect(subject).to eq(body: [[1,'name1',2]], head: ["Артикул", "Название магазина", "Остаток"])
    end
  end

end