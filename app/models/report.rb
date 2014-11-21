class Report < ActiveRecord::Base

  include Humanizer
  require_human_on :create

  belongs_to :episode

  PROBLEM_SELECT = ['Video Broken', 'Audio Broken', 'Subtitle Out Of Sync', 'Wrong Video', 'Other']
end
