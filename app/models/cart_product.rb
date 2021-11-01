class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }

  def price
    quantity * product.price
  end

  def self.add_product(cart, product)
    cart_product = CartProduct.find_by(cart_id: cart, product_id: product)
    if cart_product
      cart_product.quantity += 1
    else
      cart_product = cart.cart_products.build(product: product)
    end
    cart_product
  end

  def remove_product
    self.quantity -= 1
    valid? ? save : destroy
  end
end
