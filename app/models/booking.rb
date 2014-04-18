class Booking < ActiveRecord::Base
  AVAILABLE_TIMES = (9..17)
  AVAILABLE_EQUIPMENT = ['PCR1', 'PCR2', 'HPLC', 'Shakers']

  belongs_to :user
end
