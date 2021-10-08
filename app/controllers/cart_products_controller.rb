class CartProductsController < ApplicationController

  def new
    @cart_product = CartProduct.new(cart_product_params)
    authorize @cart_product
    if @cart_product.save
      redirect_to _path
  end

  private

  def cart_product_params
    params.require(:cart_product_id).permit(:product, :cart)
  end
end
