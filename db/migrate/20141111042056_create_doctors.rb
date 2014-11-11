class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :ids, :unique => true
      t.string :name, :null => false
      t.belongs_to :department
      t.references :major
      t.string :major_name
      t.string :grade
      t.text :introduction
      t.references :calendar

      t.timestamps
    end
  end
end
