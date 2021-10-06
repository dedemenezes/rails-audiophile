require 'rails_helper'

RSpec.describe Piece, type: :model do
  before :each do
    @piece = FactoryBot.build(:piece)
  end

  context "Validations" do
    it 'must name and amount' do
      piece = described_class.new
      expect(piece).to_not be_valid
      expect(@piece).to be_valid
    end

    it 'should be valid with valid attributes' do
      expect(@piece).to be_valid
    end
  end

  context "Associations" do
    it { should have_many(:product_pieces) }
    it { should have_many(:products).through(:product_pieces) }
  end
  
end
