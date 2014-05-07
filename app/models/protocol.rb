class Protocol < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true

  def self.from_relevant_protocols(user)
    protocols_array= []
    user.relevant_protocols.each do |rel_protocol|
      protocols_array.push(rel_protocol.to_protocol_id)
    end
    Protocol.where("id IN (?)", protocols_array)
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
end
