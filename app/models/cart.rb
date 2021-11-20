class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def total_price
    cart_products.reduce(0) do |memo, element|
      memo + (element.quantity * element.product.price)
    end
  end

  def product_count
    cart_products.reduce(0) { |mime, order| mime + order.quantity }
  end

  # def total_price_to_s
  #   price = total_price
  #   binding.pry
  #   if price.digits.size > 3
  #     price_str = price.to_s
  #     "$#{price_str[0...-3]}.#{price_str[-3..]},00"
  #   else
  #     "$#{price},00"
  #   end
  # end

  def find_cart_product(product)
    cart_products.where('product_id = ?', product.id).first
  end

  def is_empty?
    cart_products.empty?
  end
end
