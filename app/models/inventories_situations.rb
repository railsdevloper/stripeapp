class InventoriesSituations < ActiveRecord::Base

  belongs_to :inventory
  belongs_to :situation

end
