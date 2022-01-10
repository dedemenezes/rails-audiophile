class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true # , uniqueness: { case_sensitve: false }

  def self.top_earphone
    find_by(name: 'earphones').products.order(:price_cents).reverse.first
  end
end
