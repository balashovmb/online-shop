require "rails_helper"

describe ProductsShop::PrepareList do
  before do
    2.times { create(:products_shop) }
  end

  let(:subject) do
    described_class.call(shop_ids, props)
  end

  context "without additional properties" do
    let(:shop_ids) { [Shop.first.id] }
    let(:props) { [] }
    it "prepares list" do
      expect(subject).to eq(body: [[2, "Shop2", 2]], head: ["Артикул", "Название магазина", "Остаток"])
    end
  end

  context "with additional properties" do
    let(:shop_ids) { [Shop.first.id, Shop.last.id] }
    let(:props) { ["product_name", "cost", "city", "address", "subway", "size", "weight"] }
    it "prepares list" do
      expect(subject).to eq(
        body: [
          [4, "Shop4", 2, "Product name", 1.0, City.first.name , "Address4", "Subway4", 4, 4],
          [5, "Shop5", 2, "Product name", 1.0, City.last.name, "Address5", "Subway5", 5, 5]
        ],
        head: [
          "Артикул", "Название магазина", "Остаток", "Название товара",
          "Цена", "Город", "Адрес магазина", "Метро", "Размер", "Вес"
        ])
    end
  end
end
