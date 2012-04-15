# == Schema Information
#
# Table name: inventories_situations
#
#  id           :integer         not null, primary key
#  inventory_id :integer
#  situation_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class InventoriesSituations < ActiveRecord::Base

  belongs_to :inventory
  belongs_to :situation

end
