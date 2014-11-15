class ChangeOrder < ActiveRecord::Migration
  def change
    add_column :orders,:status, :integer, :default => 0, :comment => '0 : 新建, 1: 已到场, 2: 已过期, 3: 已取消, 4: 已完成'
  end
end
