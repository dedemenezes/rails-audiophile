require 'rails_helper'

RSpec.describe "CartProducts", type: :controller do
  before :each do
    let(:user) { create(:user) }
    allow(controller).to receive(:current_user).and_return(user)
    create(:cart, user: user)
  end

  describe "#create" do
    it 'should add product to cart' do
      post :create, params: {id: subject.id, user: user}
    end
  end
end
