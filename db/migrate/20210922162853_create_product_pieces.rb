class CreateProductPieces < ActiveRecord::Migration[6.1]
  def change
    create_table :product_pieces do |t|
      t.references :product, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
