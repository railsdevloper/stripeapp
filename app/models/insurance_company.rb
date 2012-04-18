class InsuranceCompany < ActiveRecord::Base
  
  validates :name, :uniqueness => { :scope => :subscription_id }
  
  belongs_to :subscription
  
end
