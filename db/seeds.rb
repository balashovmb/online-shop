# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
c1 = City.create(name: 'Екатеринбург')
c2 = City.create(name: 'Москва')
s1 = Shop.create(name: 'Незабудка', address: 'ул. Ленина,5', subway: 'Площадь 1905 года', city: c1)
s2 = Shop.create(name: 'Ромашка', address: 'ул. Большакова, 4', city: c1)
s3 = Shop.create(name: 'Ромашка', address: 'ул. Тверская, 4', city: c2, subway: 'Пушкинская')
p1 = Product.create(item_number: 1, name: 'Отвертка', weight: 1, size:12, color: 'Черный')
p2 = Product.create(item_number: 2, name: 'Плоскогубцы', weight: 1, size:10, color: 'Красный')
p3 = Product.create(item_number: 3, name: 'Пила', weight: 2, size:52, color: 'Синий')
ProductsShop.create(shop: s1, product: p1, cost: 111, quantity: 10)
ProductsShop.create(shop: s1, product: p2, cost: 222, quantity: 5)
ProductsShop.create(shop: s2, product: p3, cost: 333, quantity: 3)
ProductsShop.create(shop: s1, product: p3, cost: 333, quantity: 3)
ProductsShop.create(shop: s2, product: p1, cost: 112, quantity: 2)
ProductsShop.create(shop: s3, product: p1, cost: 134, quantity: 31)
