class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products


  def total_price
    products.sum(:price)
  end

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
