class ProtocolsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def new
    @protocol = Protocol.new
  end

  def create
    @protocol = current_user.protocols.build(order_params)
    current_user.microposts.create( :content => "#{current_user.name} posted the protocol: #{order_params[:title]}")                                    
    if @protocol.save
      flash[:success] = "Protocol created!"
      redirect_to action: 'view'
    else
      @protocol_feed_items = []
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
    @all_protocol_feed_items = current_user.all_protocol_feed.paginate(page: params[:page])
  end


  def show
    @protocols =  Protocol.find(params[:id])
  end

  def relevant?(protocol)
    relevant_protocols.find_by(to_protocol_id: protocol.id)
  end

  def make_relevant!(protocol)
    relevant_protocols.create!(to_protocol_id: protocol.id)
  end

  def make_irrelevant!(protocol)
    relevant_protocols.find_by(to_protocol_id: protocol.id).destroy
  end

  def self.from_protocols_followed_by(user)
    followed_protocol_ids = user.relevant_protocols.ids
    where("user_id IN (?) OR user_id = ?", followed_protocol_ids, user)
  end

  private

  def order_params
    params.require(:protocol).permit(:title, :content, :user_id, :public_contact)
  end

  def correct_user
    @protocol = current_user.protocols.find_by(id: params[:id])
    redirect_to root_url if @protocol.nil?
  end
end

