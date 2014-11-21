class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :problem
      t.text :other

      t.timestamps
    end
  end
end
