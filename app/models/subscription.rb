class Subscription < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :position, :company, 
                  :company_addr, :city, :state, :zip_code, :phone_no, :last_four_digit, :cardholder_name, :card_type, 
                  :expiration_month, :expiration_year, :plan_id, :stripe_card_token, :website

  belongs_to :plan

  validates_presence_of :plan_id
  validates_confirmation_of :password
  validates_presence_of :password_confirmation
  validates_presence_of :first_name, :last_name, :company, :phone_no, :zip_code, :city, :company_addr

  # ToDo - Write all these validation in seperate rb file and use here as concerned_with
  # written website_validator for this validation
  validates  :website, :presence   => true,
                       :uniqueness => true,
                       :website  => true

  validates_format_of :first_name, :last_name, :with => /^[a-z\-]*$/i, :message => "can only contain letters, and hyphens"
  validates_format_of :first_name, :last_name, :company, :company_addr, :with => /^[^-].*[^-]$/, :message => "cannot start or end with a hyphen"
  validates_length_of :first_name, :last_name, :maximum => 31


  validates_format_of :company, :company_addr, :with => /^[a-z0-9.\-]*$/i, :message => "can only contain letters, numbers, period and hyphens"
  validates_length_of :company, :city, :cardholder_name, :maximum => 31

  validates_length_of :company_addr, :maximum => 63

  validates_format_of :city, :cardholder_name, :with => /^[a-z\-]*$/i, :message => "can only contain letters and hyphens"

  validates_length_of :zip_code, :is => 5

  validates_format_of :first_name, :last_name, :with => /^[a-z\-]*$/i, :message => "can only contain letters and hyphens"
  validates_format_of :first_name, :last_name, :with => /^[^-].*[^-]$/, :message => "cannot start or end with a hyphen"
  validates_length_of :first_name, :last_name, :maximum => 31


  validates_format_of :phone_no, :with => /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, :message => 'is invalid'


  attr_accessor :stripe_card_token

  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.last_four_digit = customer[:active_card][:last4]
      self.cardholder_name = customer[:active_card][:name]
      self.card_type = customer[:active_card][:type]
      self.expiration_month = customer[:active_card][:exp_month]
      self.expiration_year = customer[:active_card][:exp_year]
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

end
