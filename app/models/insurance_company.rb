class InsuranceCompany < ActiveRecord::Base
  
  validates :name, :uniqueness => true
  
  belongs_to :subscription
  
end
