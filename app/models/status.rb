# == Schema Information
#
# Table name: statuses
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Status < ActiveRecord::Base  
  has_and_belongs_to_many :jobs
end
