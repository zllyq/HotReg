class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name, :null => false
      t.references :province
      t.string :province_name, :limit => 31
      t.references :city
      t.string :city_name, :limit => 31
      t.string :address, :null => false
      t.references :grade
      t.string :grades_name, :limit => 31
      t.references :major
      t.string :major_name, :limit => 31
      t.string :phone
      t.text :introduction

      t.timestamps
    end
  end
end
