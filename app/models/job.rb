class Job < ActiveRecord::Base
  validates :customer_name, :address, :city, :state, :zip_code, :phone, :email,
 :insurance_company, :adjuster , :claim_number, :presence => true                             
  validates   :phone, :numericality => true
  validates :email, :format => {:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :message => "format is not proper"}

  has_many :inventories
  belongs_to :subscription
  has_and_belongs_to_many :statuses

  before_save :set_subscription_id


  def set_subscription_id
    self.subscription_id = Subscription.current_subscription.try(:id)
  end

end

