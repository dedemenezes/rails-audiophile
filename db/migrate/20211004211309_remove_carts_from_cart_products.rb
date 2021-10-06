class RemoveCartsFromCartProducts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :cart_products, :carts, name: "index_cart_products_on_carts_id"
  end
end
