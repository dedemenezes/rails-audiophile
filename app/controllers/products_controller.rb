class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :all_categories, :find_user_cart

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    authorize @product
  end
end
