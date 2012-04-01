class InventoriesController < ApplicationController

  def index
    
  end

  def show
    
  end

  def create
    @inventory = Inventory.new(params[:inventory])
    if @inventory.save
      redirect_to inventory_path(@inventory) 
    else
     render :action => "new"
    end    
  end

  def new
    @inventory = Inventory.new
#    render("new.html.erb")
  end

  def destroy
    
  end

  def update
    
  end

end
