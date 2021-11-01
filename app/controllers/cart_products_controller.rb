class CartProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart, only: %i[create destroy]

  def create
    product = Product.find(params[:product_id].to_i)
    @cart_product = CartProduct.add_product(@cart, product)
    authorize @cart_product
    if @cart_product.save
      redirect_to cart_path(@cart)
      flash[:notice] = "Product added to cart"
    else
      render :back
      flash[:alert] = "Product NOTTTT added to cart"
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    authorize @cart_product
    if @cart_product.remove_product
      if @cart.is_empty?
        redirect_to root_path, notice: "Your cart is now empty."
      else
        redirect_to cart_path(@cart), notice: "Product removed from cart"
      end
    else
      flash[:alert] = "Product NOT removed from cart"
      redirect_to cart_path(@cart_product.cart)
    end
  end
end
