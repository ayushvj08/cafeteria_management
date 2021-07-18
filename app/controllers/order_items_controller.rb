class OrderItemsController < ApplicationController
  def index
    @order = Order.where(user_id: session[:current_user_id])
  end

  def show
    @order = Order.all
  end

  def create
    @order = Order.create!(
      date: Date.today,
      user_id: session[:current_user_id],
      delivered_at: nil,
    )
    @cart_items = ShoppingCart.all
    @cart_items.each do |cart_item|
      @new_order_item = OrderItem.create!(
        menu_item_id: cart_item[:menu_item_id],
        menu_item_name: cart_item[:menu_item_name],
        menu_item_price: cart_item[:menu_item_price],
        order_id: @order.id,
      )
    end

    flash[:msg] = "Order Placed! Check status of your order by visiting order status."
    ShoppingCart.where(user_id: current_user).destroy_all
    @cart_items = nil
    redirect_to cafe_path
  end

  def update
    @order = Order.find(params[:format])
    @order[:delivered_at] = Date.today
    @order.save!
    flash[:msg] = "Order is Marked as Delivered"
    redirect_to order_view_path
    # else
    #   flash[:error] = "There was a problem delivering the order"
    #   redirect_to order_view_path
    # end
  end
end
