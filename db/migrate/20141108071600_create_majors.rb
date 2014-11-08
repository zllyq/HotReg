class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.integer :code, :unique => true
      t.string :name, :unique => true, :limit => 31, :null => false
      t.text :introduction, :null => true
    end
  end
end
