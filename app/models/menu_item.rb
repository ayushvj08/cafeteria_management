class MenuItem < ApplicationRecord
  belongs_to :menu_category
  has_many :order_item
end
