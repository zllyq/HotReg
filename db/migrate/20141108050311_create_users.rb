class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :unique, :index => true
      t.string :passwd, :limit => 32
      t.integer :type, :limit => 1, :default => 1
      t.string :name, :unique
      t.string :id_card, :unique, :limit => 18
      t.string :phone, :unique, :limit => 11
      t.string :email, :unique
      t.integer :status, :limit => 1, :default => 0
      t.integer :point, :limit => 1, :default => 3

      t.timestamps
    end
  end
end
