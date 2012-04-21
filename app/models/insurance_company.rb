class InsuranceCompany < ActiveRecord::Base
  
  validates :name, :presence => true, :uniqueness => { :scope => :subscription_id }
  
  belongs_to :subscription
  
end
