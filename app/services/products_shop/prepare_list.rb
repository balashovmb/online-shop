class ProductsShop::PrepareList < Service

  def initialize(shop_ids, properties)
    @shop_ids = shop_ids
    @properties = properties
  end

  def call
    products_shops = ProductsShop.where(shop_id: shop_ids)
    Rails.logger.info products_shops
    list = []
    products_shops.each do |ps|
      row = []
      row << ps.product.item_number
      row << ps.shop.name
      row << ps.quantity
      row += additional_properties(ps)
      list << row
    end
    list
  end

  private

  def additional_properties(ps)
    add_cells = []
    add_cells << ps.product.name if properties.include?(:name) 
    add_cells << ps.cost if properties.include?(:cost)
    add_cells << ps.shop.city if properties.include?(:city)
    add_cells << ps.shop.adress if properties.include?(:adress)
    add_cells << ps.shop.subway if properties.include?(:subway)
    add_cells << ps.product.size if properties.include?(:size)
    add_cells << ps.product.weight if properties.include?(:weight)  
    add_cells  
  end

  attr_reader :shop_ids, :properties
end
