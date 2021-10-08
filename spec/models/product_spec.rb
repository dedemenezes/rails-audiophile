require 'rails_helper'

RSpec.describe Product, type: :model do
  context "Validations" do
    let(:product) { FactoryBot.build(:product) }
    it 'must have name' do
      expect(product).to be_valid
      product.name = ""
      expect(product).to_not be_valid
    end
    it 'must have price' do
      expect(product).to be_valid
      product.price = ""
      expect(product).to_not be_valid
    end
    it 'must have description' do
      expect(product).to be_valid
      product.description = ""
      expect(product).to_not be_valid
    end
    it 'must have features' do
      expect(product).to be_valid
      product.features = ""
      expect(product).to_not be_valid
    end
  end

  context "Associations" do
    it { should belong_to(:category) }
    it { should have_many(:product_pieces) }
    it { should have_many(:pieces).through(:product_pieces) }
    it { should have_many(:cart_products) }
    it { should have_many(:cart).through(:cart_products) }
  end

  context "#most_expensive" do
    it 'should return the most expensive product' do
      3.times { |_| create(:product) }
      highest_price = Product.maximum(:price)
      expect(Product.most_expensive).to eq(Product.find_by(price: highest_price))
    end
  end

  context "#top_two" do
    it 'should return two most expensive products' do
      3.times { |_| create(:product) }
      expect(Product.top_two[:first]).to eq(Product.most_expensive)
      expect(Product.top_two[:second]).to eq(Product.order(:price).reverse.second)
    end
  end
end
