class OrderItemsController < ApplicationController
  def show
    @order = Order.find(params[:order])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def create
    @order = Order.create!(
      date: Date.today,
      user_id: session[:current_user_id],
      delivered_at: nil,
    )

    @cart_items = ShoppingCart.where(user_id: current_user)

    @cart_items.each do |cart_item|
      @new_order_item = OrderItem.create!(
        menu_item_id: cart_item[:menu_item_id],
        menu_item_name: cart_item[:menu_item_name],
        menu_item_price: cart_item[:menu_item_price],
        order_id: @order.id,
      )
    end

    flash[:msg] = "Order Placed! Check status of your order by visiting My orders."
    ShoppingCart.where(user_id: current_user).destroy_all
    @cart_items = nil
    redirect_to cafe_path
  end
end
