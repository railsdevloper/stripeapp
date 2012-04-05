class PlansController < ApplicationController
  skip_before_filter :authenticate_subscription!

  def index
    @plans = Plan.order("price")
  end
end
