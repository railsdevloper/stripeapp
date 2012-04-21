# == Schema Information
#
# Table name: jobs
#
#  id                :integer         not null, primary key
#  customer_name     :string(255)
#  address           :text
#  city              :string(255)
#  state             :string(255)
#  zip_code          :string(255)
#  phone             :text
#  email             :string(255)
#  insurance_company :string(255)
#  adjuster          :string(255)
#  claim_number      :integer
#  created_at        :datetime
#  updated_at        :datetime
#  status            :string(255)
#  subscription_id   :integer
#

class Job < ActiveRecord::Base
  validates :customer_name, :address, :city, :state, :zip_code, :phone, :email,
 :insurance_company, :adjuster , :claim_number, :presence => true                             
  validates   :phone, :numericality => true
  validates :email, :format => {:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :message => "format is not proper"}

  has_many :inventories
  belongs_to :subscription
  has_and_belongs_to_many :statuses

  before_save :set_subscription_id, :strip_customer_name

  after_save :set_statuses


  def set_subscription_id
    self.subscription_id = Subscription.current_subscription.try(:id)
  end

  def set_statuses
    status_id = Status.find_by_name("Active")
    JobsStatus.create(:job_id => self.try(:id), :status_id => status_id)    
  end
  
  def strip_customer_name
    self.customer_name = customer_name.gsub("-"," ")
  end

end

