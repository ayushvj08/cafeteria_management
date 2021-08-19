class ShoppingCartController < ApplicationController
  before_action :ensure_user_logged_in, :verify_authenticity_token

  def index
    @cart_items = ShoppingCart.all
  end

  def create
    @cart_item = ShoppingCart.new(
      menu_category_name: params[:menu_category_name],
      menu_item_id: params[:menu_item_id],
      menu_item_name: params[:menu_item_name],
      menu_item_price: params[:menu_item_price],
      user_id: session[:current_user_id],
    )
    @cart_items = ShoppingCart.where(user_id: current_user)
    @menu_categories = MenuCategory.all
    @menu_items = MenuItem.all
    @cart_item.save
    # flash[:msg] = "Added a New Item to Cart."
    # redirect_to cafe_path
    # end
    #   flash[:error] = "error saving item to cart"
    #   redirect_to cafe_path
    # end
    # @cart_item.save
  end

  def destroy
    @cart_items = ShoppingCart.where(user_id: current_user)
    @menu_categories = MenuCategory.all
    @menu_items = MenuItem.all
    @deleted_cart_item = ShoppingCart.where(user_id: current_user).find(params[:id])
    @deleted_cart_item.destroy
    # cart_item = current_user.shopping_cart
    # if cart_item != nil
    #   cart_item.destroy
    # else
    #   flash[:msg] = "Cart Item already deleted! Nothing to delete."
    #   redirect_to cafe_path
    # end
    # flash[:msg] = "Successfully Removed Item from Cart."
    # redirect_to cafe_path
  end
end
