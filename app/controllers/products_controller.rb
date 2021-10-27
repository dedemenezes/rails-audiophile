class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    authorize @product
  end
end
