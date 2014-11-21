class AddDateAiredToSeries < ActiveRecord::Migration
  def change
    add_column :series, :date_aired, :date
  end
end
