class ProductsShopsController < ApplicationController
  def get_list
    @shops = Shop.order(:city, :name, :address)
    shop_ids = params[:shop_ids]
    props = params[:props]
    @products_list = ProductsShop::PrepareList.call(shop_ids, props) if shop_ids && shop_ids.any?
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename='products_shops.xlsx'"
      }
      format.html
    end
  end
end
