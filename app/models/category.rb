class Category < ApplicationRecord
  has_many :products
  has_one_attached :photo

  validates :name, presence: true, uniqueness: { case_sensitve: false }
end
