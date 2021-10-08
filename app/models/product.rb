class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_products, dependent: :destroy
  has_many :cart, through: :cart_products
  has_many :product_pieces, dependent: :destroy
  has_many :pieces, through: :product_pieces, dependent: :destroy
  has_many_attached :photos

  validates :name, :price, :description, :features, presence: true
  # validates :name, uniqueness: { case_sensitive: false }
  validates :price, numericality: { greater_than: 10 }

  before_destroy :ensure_not_referenced_by_any_cart_product

  def self.most_expensive
    order(:price).reverse.first
  end

  def self.top_two
    # max_price = Product.maximum('price')
    # most_expensive_product = Product.find_by(price: max_price)
    ordered = all.order('price').reverse
    { first: ordered.first, second: ordered.second }
  end

  def get_main_image(device)
    placeholder = "#{name.gsub(' ', '_')}%#{device}%product%"
    ActiveStorage::Blob.where('filename LIKE ?', placeholder).first
  end

  def get_gallery_images(device)
    name_use = name.gsub(" ", "_")
    ActiveStorage::Blob.where('filename LIKE ?', "#{name_use}%#{device}%gallery%")
  end

  def price_to_s
    if price.digits.size > 3
      price_str = price.to_s
      "$#{price_str[0...-3]}.#{price_str[-3..]},00"
    else
      "$#{price},00"
    end
  end

  def new?
    new
  end
end
