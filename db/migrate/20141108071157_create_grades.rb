class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :code, :unique => true
      t.string :name, :unique => true, :null => false
    end
  end
end
