class User < ApplicationRecord
  has_secure_password
  has_one :shopping_cart
  has_many :orders
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :role, presence: true
end
