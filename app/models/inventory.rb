class Inventory < ActiveRecord::Base
  attr_accessible :avatar, :item_name, :room, :local_location_1, :local_location, :global_location_1, :global_location,
                  :condition, :notes 
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" }
  validates :item_name, :presence => true
  belongs_to :job
end
