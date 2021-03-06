class SubscriptionsController < ApplicationController
  respond_to :html
  
  skip_before_filter :authenticate_subscription!, :only => [:create, :new]

  def new
    @plan = Plan.find_by_name(params[:plan_name].capitalize)
    @subscription = @plan.subscriptions.build
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    @plan = @subscription.plan
    if @subscription.save_with_payment
      SubscriptionMailer.sign_up(@subscription).deliver  
      sign_in(:subscription, @subscription)
      respond_with @subscription, :location => after_sign_in_path_for(@subscription)
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
