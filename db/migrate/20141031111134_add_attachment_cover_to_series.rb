class AddAttachmentCoverToSeries < ActiveRecord::Migration
  def self.up
    change_table :series do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :series, :cover
  end
end
