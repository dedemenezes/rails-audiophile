require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @product = FactoryBot.build(:product)
  end
  context "Validations" do
    it 'must have name' do
      expect(@product).to be_valid
      @product.name = ""
      expect(@product).to_not be_valid
    end
    it 'must have price' do
      expect(@product).to be_valid
      @product.price = ""
      expect(@product).to_not be_valid
    end
    it 'must have description' do
      expect(@product).to be_valid
      @product.description = ""
      expect(@product).to_not be_valid
    end
    it 'must have features' do
      expect(@product).to be_valid
      @product.features = ""
      expect(@product).to_not be_valid
    end
  end

  context "Associations" do
    it { should belong_to(:category) }
    it { should have_many(:product_pieces) }
    it { should have_many(:pieces).through(:product_pieces) }
    it { should have_many(:cart_products) }
    it { should have_many(:cart).through(:cart_products) }
  end
end
