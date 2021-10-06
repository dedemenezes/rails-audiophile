class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true # , uniqueness: { case_sensitve: false }
end
