class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_cart

  def home
    @categories = Category.all
    @top_two = Product.top_two
  end
end
