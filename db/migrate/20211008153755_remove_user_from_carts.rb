class RemoveUserFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :carts, :user, name: "index_carts_on_user_id"
  end
end
