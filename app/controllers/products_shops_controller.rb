class ProductsShopsController < ApplicationController
  def select_city
    session[:city_ids] = nil
    @cities = City.order(:name)
    if params[:form]
      city_ids = params[:city_ids]
      if city_ids
        session[:city_ids] = city_ids
        redirect_to "/products_shops/get_list"
      else
        redirect_to "/products_shops/select_city",
                    alert: 'Не выбран город.'
      end
    end
  end

  def get_list
    city_ids = session[:city_ids]
    @shops = Shop.where(city_id: city_ids).eager_load(:city).order('cities.name', :name, :address)
    shop_ids = params[:shop_ids]
    props = params[:props]
    if params[:form] && !shop_ids
      redirect_to "/products_shops/get_list",
                  alert: 'Выберите один или несколько магазинов для формирования отчета.'
    end
    @products_list = ProductsShop::PrepareList.call(shop_ids, props) if shop_ids && shop_ids.any?
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename='Отчет_по_остаткам.xlsx'"
      }
      format.html
    end
  end
end
