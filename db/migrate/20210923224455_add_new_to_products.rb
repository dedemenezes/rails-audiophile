class AddNewToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :new, :boolean, default: false
  end
end
