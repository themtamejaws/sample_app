class Booking < ActiveRecord::Base
  AVAILABLE_TIMES = (9..17)

  belongs_to :user
end
