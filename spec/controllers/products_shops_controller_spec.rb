require 'rails_helper'

RSpec.describe ProductsShopsController, type: :controller do

  describe "GET #get_list_products_shops" do
    context "html" do
      it 'shows report options page' do
        get :get_list
        expect(response).to render_template "products_shops/get_list"
      end
    end

    context "xlsx" do
      before { create(:products_shop) }
      it 'allows to download report file' do
        get :get_list, format: :xlsx, params: { shop_ids: [Shop.first.id], props: [] }
        expect(response.headers['Content-Disposition']).to eq "attachment; filename='products_shops.xlsx'"
      end
    end
  end
end
