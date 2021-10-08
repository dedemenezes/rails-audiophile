class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def total_price
    price_to_s(products.sum(:price))
  end
  
  def price_to_s(price)
    if price.digits.size > 3
      price_str = price.to_s
      "$#{price_str[0...-3]}.#{price_str[-3..]},00"
    else
      "$#{price},00"
    end
  end
end
