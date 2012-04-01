class InventoriesController < ApplicationController
  layout "form"

  def index
    @inventories = Inventory.all
    
  end

  def show    
    @inventory = Inventory.find_by_item_name(params[:inventory_name])
  end

  def create
    @job = Job.find(params[:job_id])
    @inventory = @job.inventories.new(params[:inventory])
    if @inventory.save
      redirect_to "/jobs/#{@job.customer_name}/inventory/#{@inventory.item_name}" 
#      redirect_to inventory_path(@inventory) 
    else
     render :action => "new"
    end    
  end

  def new
    @job = Job.find_by_customer_name(params[:customer_name])
    @inventory = @job.inventories.new
#    @inventory = Inventory.new
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def destroy
    
  end

  def update
    
  end

end
