module ApplicationHelper
  
  def resource_name
    :subscription
  end

  def resource
    @resource ||= Subscription.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:subscription]
  end

end
