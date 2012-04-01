class Job < ActiveRecord::Base
  validates :name, :job_detail, :presence => true 
  has_many :inventories
end
