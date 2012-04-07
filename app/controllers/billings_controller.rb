class BillingsController < ApplicationController

  def index
    @billing = current_subscription
  end

end
