class AddResearchInfoToUser < ActiveRecord::Migration
  def change
                add_column :users, :research_title, :text, default: ' '
  end
end
