class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.integer :code, :unique => true
      t.string :name, :unique => true, :null => false
    end
  end
end
