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

end
