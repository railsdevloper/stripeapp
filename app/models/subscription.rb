# == Schema Information
#
# Table name: subscriptions
#
#  id                     :integer         not null, primary key
#  plan_id                :integer
#  email                  :string(255)
#  password               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  stripe_customer_token  :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  position               :string(255)
#  company                :string(255)
#  company_addr           :text
#  city                   :string(255)
#  state                  :string(255)
#  zip_code               :integer
#  country                :string(255)
#  phone_no               :text
#  cardholder_name        :string(255)
#  last_four_digit        :integer
#  expiration_month       :integer
#  expiration_year        :integer
#  card_type              :string(255)
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  username               :string(255)
#

class Subscription < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :position, :company, 
                  :company_addr, :city, :state, :zip_code, :phone_no, :last_four_digit, :cardholder_name, :card_type, 
                  :expiration_month, :expiration_year, :plan_id, :stripe_card_token, :username

  belongs_to :plan
  has_many :jobs

  cattr_accessor :current_subscription

  concerned_with :signup_validations

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

  def jobs_status(job_status)
    statuses =  jobs.map(&:statuses).map(&:last)
    statuses.reject!{|status| status.try(:name) != job_status}
  end

end
