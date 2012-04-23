class Subscription < ActiveRecord::Base
  
  validates_presence_of :plan_id
  validates_confirmation_of :password
  validates_presence_of :password_confirmation
  validates_presence_of :first_name, :last_name, :company, :phone_no, :zip_code, :city, :company_addr

  # ToDo - Write all these validation in seperate rb file and use here as concerned_with
  # written website_validator for this validation
  validates  :username, :presence   => true,
                       :uniqueness => true
#                       :website  => true

  validates_format_of :first_name, :last_name, :with => /^[a-z\-]*$/i, :message => "can only contain letters, and hyphens"
  validates_format_of :first_name, :last_name, :company, :company_addr, :with => /^[^-].*[^-]$/, :message => "cannot start or end with a hyphen"
  validates_length_of :first_name, :last_name, :maximum => 31


  validates_format_of :company, :company_addr, :with => /^[a-z0-9. \-]*$/i, :message => "can only contain letters, numbers, period and hyphens"
  validates_length_of :company, :city, :cardholder_name, :maximum => 31

  validates_length_of :company_addr, :maximum => 63

  validates_format_of :city, :cardholder_name, :with => /^[a-z\- ]*$/i, :message => "can only contain letters and hyphens"

  validates_length_of :zip_code, :is => 5

  validates_format_of :first_name, :last_name, :with => /^[a-z\-]*$/i, :message => "can only contain letters and hyphens"
  validates_format_of :first_name, :last_name, :with => /^[^-].*[^-]$/, :message => "cannot start or end with a hyphen"
  validates_length_of :first_name, :last_name, :maximum => 31


  validates_format_of :phone_no, :with => /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, :message => 'is invalid'

end
