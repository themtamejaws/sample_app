class OrdersController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def new 
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    current_user.microposts.create( :content => "#{current_user.name} ordered #{order_params[:order_name]} from #{order_params[:order_supplier]}")
    if @order.save
      flash[:success] = "Order created!"
      redirect_to action: 'view'
    else
      @order_feed_items = []
      render 'orders/view'
    end
  end

  def destroy
    @order.destroy
    redirect_to action: 'view'
  end

  def view
    @order = current_user.orders.build
    @order_feed_items = current_user.order_feed.paginate(page: params[:page])
  end

  private

  def order_params
    params.require(:order).permit(:order_name, :order_number, :order_size, :order_price, :order_supplier, :notes)
  end

  def correct_user
    @order = current_user.orders.find_by(id: params[:id])
    redirect_to root_url if @order.nil?
  end
end
