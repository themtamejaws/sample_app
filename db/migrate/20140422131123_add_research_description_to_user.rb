class AddResearchDescriptionToUser < ActiveRecord::Migration
  def change
                    add_column :users, :research_description, :text, default: ' ' 
  end
end
