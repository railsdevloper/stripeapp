class InventoriesController < ApplicationController
  respond_to :html

  def index
    @inventories = Inventory.all   
  end

  def show    
    @inventory = Inventory.find(params[:id]) if params[:id]
    @inventory ||= Inventory.find_by_item_name(params[:inventory_name].gsub("-", " ")) if params[:inventory_name]
  end

  def create
    @job = Job.find(params[:inventory][:job_id])
    @inventory = Inventory.new(params[:inventory])
    if @inventory.save
      redirect_to "/#{current_subscription.username}/jobs/#{@job.customer_name.gsub(' ', '-')}/inventory/#{@inventory.item_name.gsub(' ', '-')}" 
    else
     render :action => "new"
    end    
  end

  def new
    @job = Job.find_by_customer_name(params[:customer_name].gsub("-", " "))
    @subscription = Subscription.find_by_username(params[:user_name])
    @inventory = @job.inventories.new
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def destroy
    
  end

  def update
    @inventory = Inventory.find(params[:id])
    @job = @inventory.job
    if @inventory.update_attributes(params[:inventory])
      redirect_to "/#{current_subscription.username}/jobs/#{@job.customer_name.gsub(' ', '-')}/inventory/#{@inventory.item_name.gsub(' ', '-')}" 
    else
     render :action => "new"
    end        
  end
  
  def add_situation
    InventoriesSituations.create(:inventory_id => params[:inventory_id], :situation_id => params[:situation])
    @inventory = Inventory.find(params[:inventory_id])
    render :action => "show", :locals => {:inventory => @inventory}
  end

  def inventories
    @job = Job.find_by_customer_name(params[:customer_name].gsub("-", " "))
    @inventories = @job.inventories 
    render :action => "index"
  end

end
