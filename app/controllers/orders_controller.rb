class OrdersController < ApplicationController
  def create
    binding.pry
    cart = Cart.includes(:cart_products).find(params[:cart_id])
    cart.cart_products.each do |cart_order|
      @order = Order.create!(
        product: cart_order.product,
        product_slug: cart_order.product.slug,
        amount: cart_order.product.price,
        state: "pending",
        user: current_user
      )
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: cart_order.product.slug,
          amount: cart_order.product.price_cents,
          currency: 'brl',
          quantity: cart_order.quantity
        }],
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      )
      @order.update(checkout_session_id: session.id)
    end
    redirect_to new_order_payment_path(@order)
  end
end
