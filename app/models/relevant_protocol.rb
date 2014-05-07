class RelevantProtocol < ActiveRecord::Base
  belongs_to :relevant , class_name: "User"
  validates :for_user_id, presence: true
  validates :to_protocol_id, presence: true 
end
