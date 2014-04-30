class ProtocolsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def new
    @protocol = Protocol.new
  end

  def create
    @protocol = current_user.protocols.build(order_params)
    current_user.microposts.create( :content => "#{current_user.name} posted the protocol: #{order_params[:content]}")                                    
    if @protocol.save
      flash[:success] = "Order created!"
      redirect_to action: 'view'
    else
      @order_feed_items = []
      render 'protocols/view'
    end
  end

  def destroy
    @protocol.destroy
    redirect_to action: 'view'
  end

  def view
    @protocol = current_user.protocols.build
    @protocol_feed_items = current_user.protocol_feed.paginate(page: params[:page])
  end

  private

  def order_params
    params.require(:protocol).permit(:title, :content, :user_id)
  end

  def correct_user
    @protocol = current_user.protocols.find_by(id: params[:id])
    redirect_to root_url if @protocol.nil?
  end
end

