require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @category = Category.new(name: 'speakers')
    attributes = {
      name: "ZX9 Speaker",
      price: 200,
      description: "Upgrade your sound system with the all new ZX9 active speaker. It’s a bookshelf speaker system that offers truly wireless connectivity -- creating new possibilities for more pleasing and practical audio setups.", 
      features: "Connect via Bluetooth or nearly any wired source. This speaker features optical, digital coaxial, USB Type-B, stereo RCA, and stereo XLR inputs, allowing you to have up to five wired source devices connected for easy switching. Improved bluetooth technology offers near lossless audio quality at up to 328ft (100m).\n\nDiscover clear, more natural sounding highs than the competition with ZX9’s signature planar diaphragm tweeter. Equally important is its powerful room-shaking bass courtesy of a 6.5” aluminum alloy bass unit. You’ll be able to enjoy equal sound quality whether in a large room or small den. Furthermore, you will experience new sensations from old songs since it can respond to even the subtle waveforms.",
      new: false,
      category: @category
    }
    @product = described_class.new(attributes)
  end
  context "Validations" do
    it 'must have unique name' do
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
