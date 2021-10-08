require 'rails_helper'

RSpec.describe Cart, type: :controller do
  context "GET show" do
    it 'should access and render show page' do
      get :show
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it 'should assign cart products' do
      expect(assigns(:cart_products)).to include(an_instance_of(Product))
    end
  end
end
