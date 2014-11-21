class AddViewCountToSeries < ActiveRecord::Migration
  def change
    add_column :series, :view_count, :integer, :default => 0, :null => false
  end
end
