require 'pry-byebug'
class CartProductsController < ApplicationController
  before_action :set_cart

  def create
    @product = Product.find(product_params[:product_id].to_i)
    @cart_product = CartProduct.new(product: @product, cart: @cart)
    authorize @cart_product
    if @cart_product.save
      redirect_to product_path(@product.id)
      flash[:notice] = "Product added to cart"
    else
      render :back
      flash[:alert] = "Product NOTTTT added to cart"
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    authorize @cart_product
    if @cart_product.destroy
      flash[:notice] = "Product removed from cart"
      if @cart.empty?
        redirect_to root_path 
      else
        redirect_to cart_path(@cart_product.cart)
      end
    else
      flash[:alert] = "Product NOT removed from cart"
      redirect_to cart_path(@cart_product.cart)
    end
  end

  private

  def product_params
    params.require(:cart_product).permit(:product_id)
  end
end
