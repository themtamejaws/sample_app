class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
    @public_users = User.where(public_contact: true )
  end

  def protocols_view
    @public_protocols = Protocol.where(public_contact: true )
  end

  def protocols_show
    @protocols =  Protocol.find(params[:id])  
  end

end
