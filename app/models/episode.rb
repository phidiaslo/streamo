class Episode < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :series
  has_many :reports, dependent: :destroy

end
