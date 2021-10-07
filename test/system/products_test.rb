require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_url # "/"
    assert_selector "h1", text: "XX99 Mark II Headphones"
  end
end
