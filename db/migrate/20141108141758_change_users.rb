class ChangeUsers < ActiveRecord::Migration
  def change
    rename_column :users,:type,:types
  end
end
