
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => 25,
   :domain => "gmail.com",
   :authentication => :login,
   :user_name => "askranjeetmaurya@gmail.com",
   :password => "989235463436040",
}

