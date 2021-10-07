require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  context "Associations" do
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end
end
