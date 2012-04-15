# == Schema Information
#
# Table name: plans
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  price      :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class Plan < ActiveRecord::Base
 
  JobLimit = {"Basic" => 1, "Plus" => 3, "Pro" => 10} 

  has_many :subscriptions
end
