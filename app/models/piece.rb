class Piece < ApplicationRecord
  has_many :product_pieces, dependent: :destroy
  has_many :products, through: :product_pieces, dependent: :destroy

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0, less_than: 7 }

  def name_display
    name.split(" ").map{ |e| e.capitalize }.join(" ")
  end
end
