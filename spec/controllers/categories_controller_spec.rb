require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before :each do
    3.times { create(:product) }
    sign_in(user)
  end

  context "GET #index" do
    let(:user) { create(:user) }
    it 'should access and render index page' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end

    it 'should assign all categories' do
      get :index
      expect(assigns(:categories).first).to be_a(Category)
    end
  end

  context "GET #show" do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    it 'should not render for not looged in user' do
      sign_out(:user)
      get :show, params: { id: category.id }
      expect(response).to have_http_status(302)
      # expect(response).to render_template('devise/sessions/new')
    end

    it 'should access and render show page' do
      get :show, params: { id: category.id }
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end
  end
end
