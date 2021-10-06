require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before :each do
    3.times { create(:product) }
  end
  context "GET #show" do
    let(:category) { create(:category) }
    let(:user) { create(:user) }

    it 'should access and render show page' do
      sign_in(user)
      get :show, params: { id: category.id}
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end
  end
end
