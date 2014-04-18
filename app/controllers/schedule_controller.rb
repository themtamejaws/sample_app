class ScheduleController < ApplicationController
  before_action :signed_in_user, only: [:view, :create, :destroy]
  before_action :equipment_that_exists, only: [:view, :create, :destroy]

  def view
    @days = (Date.today..(Date.today + 7.days))
  end

  def create
    Booking.create!(user: current_user, time: params[:time], day: params[:day], equipment: params[:equipment])
    redirect_to(action: 'view')
  end

  def destroy
    Booking.destroy!(user: current_user, time: params[:time], day: params[:day], equipment: params[:equipment])
    redirect_to(action: 'view')
  end

  private
  def equipment_that_exists
    unless Booking::AVAILABLE_EQUIPMENT.include? params[:equipment]
      render :file => "/public/404.html",  :status => 404
    end
  end
end
