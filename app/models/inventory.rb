# == Schema Information
#
# Table name: inventories
#
#  id                  :integer         not null, primary key
#  item_name           :string(255)
#  room                :string(255)
#  local_location_1    :string(255)
#  local_location      :text
#  global_location_1   :string(255)
#  global_location     :text
#  condition           :string(255)
#  notes               :text
#  created_at          :datetime
#  updated_at          :datetime
#  job_id              :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Inventory < ActiveRecord::Base
  attr_accessible :avatar, :item_name, :room, :local_location_1, :local_location, :global_location_1, :global_location,
                  :condition, :notes 
  has_attached_file :avatar, 
                    :styles => { :medium => "200x200>",
                                 :thumb => "50x50#",
                                 :large => "640x640" }


#                    :storage        => :s3,     
#                    :s3_credentials => "#{Rails.root}/config/s3.yml"

  validates :item_name, :presence => true
  belongs_to :job
  has_and_belongs_to_many :situations
end
