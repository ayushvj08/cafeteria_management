class User < ApplicationRecord
  has_secure_password
  has_one :shopping_cart
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :role, presence: true
end
