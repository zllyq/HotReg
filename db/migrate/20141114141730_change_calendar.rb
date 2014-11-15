class ChangeCalendar < ActiveRecord::Migration
  def change
    rename_column :calendars, :type, :types
  end

end
