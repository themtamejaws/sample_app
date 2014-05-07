class RelevantProtocols < ActiveRecord::Base
  belongs_to :for_user_id, class_name: "User"
  belongs_to :to_protocol_id, class_name: "Protocol"
  validates :for_user_id, presence: true
  validates :to_protocol_id, presence: true
end
