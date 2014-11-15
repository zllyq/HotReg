class ChangeTabels < ActiveRecord::Migration
  def change
    add_index :doctors, :ids, :unique => true
    add_index :hospitals, :phone, :unique => true
    add_index :departments, [:Hospital_id,:name], :unique => true
    add_index :departments, :ids, :unique => true

    remove_columns :doctors, :calendar_id, :major_name
  end
end
