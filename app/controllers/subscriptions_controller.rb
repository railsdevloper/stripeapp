class SubscriptionsController < ApplicationController
  
  skip_before_filter :authenticate_subscription!, :only => [:create, :new]
  
#  layout 'signup', :only => [:new, :create]

  def new
    plan = Plan.find(params[:plan_id])
    @subscription = plan.subscriptions.build
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save_with_payment
      SubscriptionMailer.sign_up(@subscription.email, @subscription.first_name, @subscription.last_name).deliver  
      redirect_to @subscription, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
end
