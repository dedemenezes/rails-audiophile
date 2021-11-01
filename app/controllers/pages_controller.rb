class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_cart

  def home
    @banner_image_url = get_banner_image
    @banner_product = Product.find_by(name: 'XX99 Mark II Headphones')
    @top_two = Product.top_two
    # binding.pry
    @top_earphone = Category.top_earphone
  end
end
