class ApplicationController < ActionController::Base
  
  before_filter :authenticate_subscription!, :put_current_subscriber_into_model


  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
    if resource.is_a?(Subscription)
      jobs_path(current_subscription.username)
    else
      super
    end
  end

  def put_current_subscriber_into_model
    Subscription.current_subscription = current_subscription
  end


end
