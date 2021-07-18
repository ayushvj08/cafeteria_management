class ShoppingCartController < ApplicationController
  before_action :ensure_user_logged_in

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
    if @cart_item.save
      flash[:msg] = "Added a New Item to Cart."
      redirect_to cafe_path
    else
      flash[:error] = "error saving item to cart"
      redirect_to cafe_path
    end
  end

  def destroy
    cart_item = current_user.shopping_cart
    if cart_item != nil
      cart_item.destroy
    else
      flash[:msg] = "Cart Item already deleted! Nothing to delete."
      redirect_to cafe_path
    end
    flash[:msg] = "Successfully Removed Item from Cart."
    redirect_to cafe_path
  end
end
