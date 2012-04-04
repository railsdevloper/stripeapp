class SubscriptionMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def sign_up(recipient, first_name, last_name)
    @subject = "successfully sign up"
    @first_name = first_name
    @last_name = last_name
    mail(:to => "#{recipient}", :subject => "successfully sign up for stripe App")
  end
    
end
