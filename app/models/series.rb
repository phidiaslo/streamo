class Series < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "missing.jpg"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.find_by_first_letter(letter)
    where('name LIKE ?', "#{letter}%").order('name ASC')
  end

  has_many :episodes, dependent: :destroy

 end
