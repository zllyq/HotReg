class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :ids,:unique => true
      t.string :name
      t.belongs_to :hospital
      t.text :introduction

      t.timestamps
    end
  end
end
