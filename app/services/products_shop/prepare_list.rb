class ProductsShop::PrepareList < Service

  def initialize(shop_ids, properties)
    @shop_ids = shop_ids.map(&:to_i)
    @properties = properties
  end

  def call
    list = {}
    list[:head] = prepare_head
    list[:body] = prepare_body
    list
  end

  private

  def prepare_head
    head = ['Артикул', 'Название магазина', 'Остаток']
    head += additional_headings if properties.any?
    head
  end

  def additional_headings
    _additional_headings = []
    _additional_headings << 'Название товара' if properties.include?('product_name')
    _additional_headings << 'Цена' if properties.include?('cost')
    _additional_headings << 'Город' if properties.include?('city')
    _additional_headings << 'Адрес магазина' if properties.include?('address')
    _additional_headings << 'Метро' if properties.include?('subway')
    _additional_headings << 'Размер' if properties.include?('size')
    _additional_headings << 'Вес' if properties.include?('weight')
    _additional_headings
  end

  def prepare_body
    products_shops = ProductsShop.where(shop_id: shop_ids)
    body = []
    products_shops.each do |ps|
      row = []
      row << ps.product.item_number
      row << ps.shop.name
      row << ps.quantity
      row += additional_columns(ps) if properties.any?
      body << row
    end
    body
  end

  def additional_columns(ps)
    _additional_columns = []
    _additional_columns << ps.product.name if properties.include?('product_name')
    _additional_columns << ps.cost if properties.include?('cost')
    _additional_columns << ps.shop.city if properties.include?('city')
    _additional_columns << ps.shop.adress if properties.include?('address')
    _additional_columns << ps.shop.subway if properties.include?('subway')
    _additional_columns << ps.product.size if properties.include?('size')
    _additional_columns << ps.product.weight if properties.include?('weight')
    _additional_columns
  end

  attr_reader :shop_ids, :properties
end
