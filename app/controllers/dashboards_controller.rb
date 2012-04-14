class DashboardsController < ApplicationController
  
  def index
    @subscription = current_subscription
  end
  
end
