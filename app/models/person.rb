class Person < ActiveRecord::Base
  
  belongs_to :subscription
  
  before_save :update_people_hash


  def update_people_hash
    return unless contact_type == "Technician"
    self.insurance_company  = nil
    self.address = nil
    self.city = nil
    self.state = nil
    self.zip_code = nil
    self.phone_no = nil
  end

end
