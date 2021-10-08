require 'rails_helper'
require 'pry-byebug'
RSpec.describe PagesController, type: :controller do
  context "GET Home Page" do
    # let(:category) { create(:category) }
    let(:cart) { create(:cart) }

    it 'should access and render home page' do
      get :home
      expect(response).to have_http_status(200)
      expect(response).to render_template(:home)
    end

    it 'should load all categories' do
      get :home
      expect(assigns(:categories)).to eq(Category.all)
    end

    it 'should load top two products' do
      create(:product)
      create(:product)
      create(:product)
      
      get :home
      expect(assigns(:top_two)).to be_a(Hash)
      expect(assigns(:top_two).size).to eq(2)
      expect(assigns(:top_two)[:first]).to be_a(Product)
    end

    it 'should assign a shopping cart' do
      get :home
      expect(assigns(:cart)).to be_a(Cart)
      expect(cart.products).to be_empty
      # TO-DO
    end
  end
end
