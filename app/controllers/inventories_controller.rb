class InventoriesController < ApplicationController

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
      redirect_to "/jobs/#{@job.customer_name}/inventory/#{@inventory.item_name}" 
#      redirect_to inventory_path(@inventory) 
    else
     render :action => "new"
    end        
  end
  
  def add_situation
    InventoriesSituations.create(:inventory_id => params[:inventory_id], :situation_id => params[:situation])
    @inventory = Inventory.find(params[:inventory_id])
    render :action => "show", :locals => {:inventory => @inventory}
  end

end
