class ProductsShopsController < ApplicationController
#    before_action :set_product, only: [:show, :destroy, :update]

  def index
    @products_shop = ProductsShop.all
    @data[:head] = ["Product Name","City","Shop Name", "Adress", "Quantity", "Cost"]
    @data[:body] = [p_s.product.name, p_s.shop.city, p_s.shop.name, p_s.shop.adress, p_s.quantity, p_s.cost]
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename='products_shops.xlsx'"
      }
      format.html { render :index }
    end
  end

end

#    @data[:body] = [p_s.product.name, p_s.shop.city, p_s.shop.name, p_s.shop.adress, p_s.quantity, p_s.cost]