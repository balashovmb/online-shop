FactoryBot.define do
  sequence :item_number do |n|
    n
  end

  sequence :weight do |n|
    n
  end

  sequence :size do |n|
    n
  end

  sequence :color do |n|
    "Color#{n}"
  end

  factory :product do
    item_number
    name { 'Product name' }
    weight
    size
    color
  end

end
