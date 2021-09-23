class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_products
  has_many :cart, through: :cart_products
  has_many :product_pieces
  has_many :pieces, through: :product_pieces
  has_many_attached :photos

  validates :name, :price, :description, :features, :new, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
