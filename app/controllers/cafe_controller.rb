class CafeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    @menu_categories = MenuCategory.all
    @menu_items = MenuItem.all
    @cart_items = ShoppingCart.where(user_id: current_user)
  end

  def checkout
    @cart_items = ShoppingCart.where(user_id: current_user)
  end

  def cart
    @cart_items = ShoppingCart.where(user_id: current_user)
    render "mobile_shopping_cart"
  end
end
