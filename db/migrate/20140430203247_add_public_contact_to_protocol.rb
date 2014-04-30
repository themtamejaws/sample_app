class AddPublicContactToProtocol < ActiveRecord::Migration
  def change
    add_column :protocols, :public_contact, :boolean, default: false                                                      
  end
end
