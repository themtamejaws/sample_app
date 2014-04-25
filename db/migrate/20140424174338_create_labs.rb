class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :institution
      t.string :city
      t.string :lab_name
      t.string :country

      t.timestamps
    end
    add_index :labs, [ :lab_name ]
  end
end
