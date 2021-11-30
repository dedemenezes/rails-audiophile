module CurrentCart

  private

  def find_user_cart
    @user_cart = Cart.find(session[:cart_id])
  end

  def set_cart
    @cart = Cart.includes(cart_products: { product: :category }).find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
