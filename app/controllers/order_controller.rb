class OrderController < ApplicationController
  def index
    @order = Order.where(user_id: session[:current_user_id])
    if !@order.any?
      flash[:error] = "No orders! Please Checkout Items after adding them in Shopping Cart to place an order."
    end
  end

  def show
    if User.find(session[:current_user_id]).role == "admin" || User.find(session[:current_user_id]).role == "billing clerk"
      @order = Order.where.not(user_id: nil)
      render "show"
    else
      redirect_to order_path
    end
  end

  def update
    @order = Order.find(params[:format])
    @order[:delivered_at] = Date.today
    @order.save!
    flash[:msg] = "Order is Marked as Delivered"
    redirect_to order_view_path
  end

  def filter
    render "filter_form"
  end

  def filtered_orders
    from_date = params[:from_date]
    to_date = params[:to_date]
    if from_date.empty? || to_date.empty?
      flash[:error] = "Date Fields Cannot be Empty!"
      redirect_to order_filter_path
    elsif from_date > to_date
      flash[:error] = "From date must be less than To date."
      redirect_to order_filter_path
    else
      if params[:delivered_at] == "pending delivery"
        @order = Order.where(date: (from_date)..to_date).where(delivered_at: nil).where.not(user_id: nil)
        render "filtered_orders"
      elsif params[:delivered_at] == "delivered"
        @order = Order.where(date: (from_date)..to_date).where.not(delivered_at: nil).where.not(user_id: nil)
        render "filtered_orders"
      else
        @order = Order.where(date: (from_date)..to_date).where.not(user_id: nil)
        render "filtered_orders"
      end
    end
  end
end
