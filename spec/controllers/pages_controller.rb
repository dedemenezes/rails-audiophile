require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  context "GET Home Page" do
    let(:category) { create(:category) }

    it 'should access and render home page' do
      get :home
      expect(response).to have_http_status(200)
      expect(response).to render_template(:home)
    end

    it 'should load all categories' do
      get :home
      expect(assigns(:categories)).to eq([category])
    end

    it 'should load top two products' do
      create(:product)
      get :home
      expect(assigns(:top_products)).to be_a(Hash)
      expect(assigns(:top_products).size).to eq(2)
      expect(assigns(:top_products)[:first]).to be_a(Product)
    end
  end
end
