# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
s1 = Shop.create(name: 'shop1', address: 'addr1', city: 'city1')
s2 = Shop.create(name: 'shop2', address: 'addr2', city: 'city2')
p1 = Product.create(item_number: 1, name: 'prod1', weight: 2, size:3, color: 'col1')
p2 = Product.create(item_number: 2, name: 'prod2', weight: 2, size:3, color: 'col2')
p3 = Product.create(item_number: 3, name: 'prod3', weight: 1, size:3, color: 'col3')
ProductsShop.create(shop: s1, product: p1, cost: 111, quantity: 10)
ProductsShop.create(shop: s1, product: p2, cost: 222, quantity: 5)
ProductsShop.create(shop: s2, product: p3, cost: 333, quantity: 3)