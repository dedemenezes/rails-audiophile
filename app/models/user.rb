class User < ApplicationRecord
  @email_check = %r{^[\w!#$%&‘*+-/=?\^`.\{|]{1,64}@[\w\-.]{1,253}\.[a-z]{2,3}\.?[a-z]{0,2}$}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  validates :first_name, :last_name, :username, :phone_number, presence: true
  validates :username, uniqueness: { case_sensitive: false }
end
