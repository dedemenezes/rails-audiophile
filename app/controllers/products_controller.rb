class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    authorize @product
  end
end
