require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
  end

  context "Validations" do
    it 'must have email, first_name, last_name, username, password, phone_number' do
      user = described_class.new
      expect(user).to_not be_valid
      expect(@user).to be_valid
    end
    it 'should be valid email using EMAIL_CHECK regex' do
      expect(@user.email).to match(described_class::EMAIL_CHECK)
      email = "basic user@test.com"
      @user.email = email
      expect(@user.email).to_not match(described_class::EMAIL_CHECK)
    end
    it 'should be valid with valid attributes' do
      expect(@user).to be_valid
    end
  end

  context "Associations" do
    it { should have_one(:cart) }
    it { should have_many(:cart_products).through(:cart) }
    it { should have_many(:products).through(:cart_products) }
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
