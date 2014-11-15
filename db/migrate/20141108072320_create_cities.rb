class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :code, :unique => true
      t.string :name, :null => false
      t.belongs_to :province
    end
  end
end
