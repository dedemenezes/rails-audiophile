class RenamePriceOnProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :price, :price_cents
  end
end
