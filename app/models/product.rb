class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_products, dependent: :destroy
  has_many :cart, through: :cart_products
  has_many :product_pieces, dependent: :destroy
  has_many :pieces, through: :product_pieces, dependent: :destroy
  has_many_attached :photos

  validates :name, :price, :description, :features, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :price, numericality: { greater_than: 10 }

  def self.top_products
    # max_price = Product.maximum('price')
    # most_expensive_product = Product.find_by(price: max_price)
    ordered = all.order('price').reverse
    { first: ordered.first, second: ordered.second }
  end
end
