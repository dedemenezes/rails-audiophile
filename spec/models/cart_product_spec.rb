require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  context "Associations" do
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end
  describe '#add_product' do
    before :each do
      @cart = create(:cart)
    end
    context "when adding a product" do
      it "add a product to the cart" do
        @product = create :product
        subject { CartProduct.add_product(@cart, @product) }
        expect(subject).to be_a(CartProduct)
        expect(subject).to respond_to(:quantity)
        expect(subject.quantity).to eq(1)
      end
      it "add two different products" do
        @product_one = create :product
        @product_two = create :product
        CartProduct.add_product(@cart, @product_one)
        CartProduct.add_product(@cart, @product_two)
        expect(@cart.cart_products.size).to eq(2)
      end
    end
  end
end
