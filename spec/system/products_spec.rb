require 'rails_helper'

RSpec.describe "Products", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "visiting the home page" do
    it "assert banner header" do
      visit '/'
      expect(page).to have_text("XX99 Mark II Headphones")
    end

    it 'banner link to product' do
      # expect(page).to 
    end
  end
end
