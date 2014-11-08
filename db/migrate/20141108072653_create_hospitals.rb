class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name, :null => false
      t.references :provinces
      t.string :provinces_name, :limit => 31
      t.references :cities
      t.string :cities_name, :limit => 31
      t.string :address, :null => false
      t.references :grades
      t.string :grades_name, :limit => 31
      t.references :majors
      t.string :majors_name, :limit => 31
      t.string :phone
      t.text :introduction

      t.timestamps
    end
  end
end
