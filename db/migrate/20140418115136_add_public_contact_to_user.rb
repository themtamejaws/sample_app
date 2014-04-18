class AddPublicContactToUser < ActiveRecord::Migration
  def change
            add_column :users, :public_contact, :boolean, default: false
  end
end
