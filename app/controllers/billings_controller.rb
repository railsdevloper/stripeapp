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
    render 'payment_info_form'
  end

  def update
    
  end

end
