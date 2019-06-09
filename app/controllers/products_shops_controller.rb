class ProductsShopsController < ApplicationController
  def get_list
    @shops = Shop.order(:city, :name, :address)
    shop_ids = params[:shop_ids]
    props = params[:props]
    if params[:form] && !shop_ids
      redirect_to "/products_shops/get_list", alert: 'Выберите один или несколько магазинов для отчета.'
    end
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
