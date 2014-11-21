class AddEpisodeIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :episode_id, :integer
  end
end
