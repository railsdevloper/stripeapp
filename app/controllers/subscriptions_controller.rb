class SubscriptionsController < ApplicationController
  respond_to :html
  
  skip_before_filter :authenticate_subscription!, :only => [:create, :new]

  def new
    plan = Plan.find(params[:plan_id])
    @subscription = plan.subscriptions.build
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save_with_payment
      SubscriptionMailer.sign_up(@subscription.email, @subscription.first_name, @subscription.last_name).deliver  
      sign_in(:subscription, @subscription)
      respond_with @subscription, :location => after_sign_in_path_for(@subscription)
#      redirect_to jobs_path, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def cancel 
  end  

end
