class BillingsController < ApplicationController

  def index
    @billing = current_subscription
  end

  def payment_info
  end

end
