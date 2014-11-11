class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.belongs_to :doctor
      t.integer :type,:comment => '1：总是, 2: 按周, 3: 按月'
      t.integer :access, :default => 0
      t.date :off_start
      t.date :off_end

      t.timestamps
    end
  end
end
