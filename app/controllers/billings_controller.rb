class BillingsController < ApplicationController

  def index
    @billing = current_subscription
  end

  def payment_info
  end

  def cancel
    unless params[:view]
      # write logic of canceling the subscription here
    else
      # render cancel view
    end
  end

  def edit
    @subscription = current_subscription
  end

  def update
    @subscription = Subscription.find(params[:id])
    @subscription.stripe_card_token = params[:subscription_stripe_card_token]
    if @subscription.update_with_payment       
      redirect_to payment_info_billings_path(@subscription.username)
    else
      render :edit
    end
  end

  def plan_info
    @subscription = current_subscription
  end

  def plan_edit
    @subscription = current_subscription
  end


  # Just implemented the payment upgrade in a simple manner, need to refactor this code
  def plan_update
    @subscription = current_subscription
    @new_plan = Plan.find(params[:plan_id])
    new_plan_price = @new_plan.try(:price)
    current_plan_price = current_subscription.plan.try(:price)
    if new_plan_price > current_plan_price
      if @subscription.upgrade_to_plan(@new_plan)
        flash[:notice] = "Your plan has been updated. We have charged your card the $#{new_plan_price - current_plan_price} difference."
        redirect_to plan_info_billings_path(current_subscription.username)        
      else
        render :plan_edits
      end
    elsif new_plan_price < current_plan_price
      @subscription.downgrade_to_plan(@new_plan)
    else
      redirect_to plan_info_billings_path(current_subscription.username)      
    end  
  end

end
