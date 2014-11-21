class AddSubStatusToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :sub_status, :string
  end
end
