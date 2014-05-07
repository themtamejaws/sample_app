class RelevantProtocolsController < ApplicationController
  before_action :signed_in_user

  def create
    @protocol = Protocol.find(params[:relevant_protocol][:to_protocol_id])
    current_user.make_relevant!(@protocol)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @protocol = Relevant_protocol.find(params[:id]).relevant
    current_user.make_irrelevant!(@protocol)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
