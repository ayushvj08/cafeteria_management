class CafeController < ApplicationController
  def index
    @menu_categories = MenuCategory.all
    @menu_items = MenuItem.all
    @cart_items = ShoppingCart.where(user_id: current_user)
  end

  def checkout
    @cart_items = ShoppingCart.where(user_id: current_user)
  end
end
