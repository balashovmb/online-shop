FactoryBot.define do
  factory :product do
    item_number { 1 }
    name { "MyString" }
    weight { 1 }
    size { 1 }
    color { "MyString" }
    cost { 1.5 }
  end
end
