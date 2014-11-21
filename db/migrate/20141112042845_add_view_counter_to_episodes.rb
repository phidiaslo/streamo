class AddViewCounterToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :view_count, :integer, :default => 0, :null => false
  end
end
