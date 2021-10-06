class AddReferenceCartToCartProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_products, :cart, foreign_key: true
  end
end
