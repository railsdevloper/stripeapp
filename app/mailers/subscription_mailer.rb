class SubscriptionMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def sign_up(subscriber)
    @subscriber = subscriber
    recipient = subscriber.email
    @subject = "successfully sign up"
    @first_name = subscriber.first_name
    @last_name = subscriber.last_name
    mail(:to => "#{recipient}", :subject => "Welcome to Content Tracker!")
  end
    
end
