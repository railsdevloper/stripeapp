class Job < ActiveRecord::Base
  has_many :inventories
end
