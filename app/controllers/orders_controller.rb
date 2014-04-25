class OrdersController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def new 
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:success] = "Order created!"
      render 'orders/view'
    else
      @order_feed_items = []
      render 'orders/view'
    end
  end

  def destroy
    @order.destroy
    redirect_to root_url
  end

  def view
    @order = current_user.orders.build
    @order_feed_items = current_user.order_feed.paginate(page: params[:page])
  end

  private

  def order_params
    params.require(:order).permit(:order_name, :order_number, :order_size, :order_price, :notes)
  end

  def correct_user
    @order = current_user.orders.find_by(id: params[:id])
    redirect_to root_url if @order.nil?
  end
end
