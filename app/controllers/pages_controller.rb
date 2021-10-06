class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @categories = Category.all
    @top_two = Product.top_two
  end
end
