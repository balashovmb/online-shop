FactoryBot.define do
  factory :products_shop do
    product
    shop
    cost { 1 }
    quantity { 2 }
  end
end
