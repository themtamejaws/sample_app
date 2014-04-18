class ScheduleController < ApplicationController
  before_action :signed_in_user, only: [:view, :create]

  def view
    @days = (Date.today..(Date.today + 7.days))
  end

  def create
    Booking.create!(user: current_user, time: params[:time], day: params[:day])
    redirect_to(action: 'view')
  end

  def destroy
    Booking.destroy!(user: current_user, time: params[:time], day: params[:day])
    redirect_to(action: 'view')
  end
end
