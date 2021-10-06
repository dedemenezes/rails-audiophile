class RemoveUsersFromCart < ActiveRecord::Migration[6.1]
  def change
    remove_reference :carts, :users, name: "index_carts_on_users_id"
  end
end
