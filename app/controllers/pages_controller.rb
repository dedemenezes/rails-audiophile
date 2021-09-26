class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :top_products

  def home
    @categories = Category.all
  end

  private

  def top_products
    max_price = Product.maximum('price')
    most_expensive_product = Product.find_by(price: max_price)
    second_expensive_product = Product.all.order('price').reverse.second
    @top_products = { first: most_expensive_product, second: second_expensive_product }
  end
end
