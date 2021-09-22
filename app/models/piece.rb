class Piece < ApplicationRecord
  has_many :product_pieces
  has_many :products, through: :product_pieces

  validates :name, :amount, presence: true
end
