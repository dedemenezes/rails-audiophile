class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :top_products

  def home    
    @categories = Category.all
  end

  private
  def top_products
    @top_products = { first: Product.find_by(price: Product.maximum('price')), second: Product.all.order('price').reverse.second }
  end
end
