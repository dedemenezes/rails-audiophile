class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_cart

  def home
    @banner_image_url = get_banner_image
    @top_two = Product.top_two
    @top_earphone = Category.top_earphone
  end
end
