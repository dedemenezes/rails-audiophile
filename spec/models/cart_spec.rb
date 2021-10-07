require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:cart_products) }
    it { should have_many(:products).through(:cart_products) }
  end

  describe '#total_price' do
    let(:cart) { create(:cart) }
    let(:product) { create(:product, price: 100) }

    it 'should return total cart price' do
      cart.products << product
      expect(cart.total_price).to eq(100)
      4.times do
        cart.products << create(:product, price: 50)
      end
      expect(cart.total_price).to eq(300)
    end
  end
end
