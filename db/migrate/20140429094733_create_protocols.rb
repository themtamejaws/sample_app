class CreateProtocols < ActiveRecord::Migration
  def change
    create_table :protocols do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :protocols, [:user_id, :created_at]
  end
end
