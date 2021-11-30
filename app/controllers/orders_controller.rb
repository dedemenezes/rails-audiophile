class OrdersController < ApplicationController
  def create
    binding.pry
    cart = Cart.includes(:cart_products).find(params[:cart_id])
    cart.cart_products.each do |cart_order|
      
    end
  end
end
