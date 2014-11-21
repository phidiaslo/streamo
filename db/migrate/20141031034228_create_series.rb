class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.text :synopsis
      t.string :status

      t.timestamps
    end
  end
end
