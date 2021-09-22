class ProductPiece < ApplicationRecord
  belongs_to :product
  belongs_to :piece
end
