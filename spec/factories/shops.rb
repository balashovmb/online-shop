FactoryBot.define do
  sequence :name do |n|
    "Shop#{n}"
  end

  sequence :address do |n|
    "Address#{n}"
  end

  sequence :subway do |n|
    "Subway#{n}"
  end

  factory :shop do
    name
    address
    subway
    city
  end
end
