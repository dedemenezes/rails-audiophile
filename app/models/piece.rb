class Piece < ApplicationRecord
  has_many :product_pieces
  has_many :products, through: :product_pieces

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0, less_than: 3 } 
end
