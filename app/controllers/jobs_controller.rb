class JobsController < ApplicationController
  layout "form"

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @inventory = @job.inventories.new
  end

  def create
    @job = Job.create(params[:job])
    if @job.save
      redirect_to "/jobs/#{@job.customer_name}/inventory" 
    else
     render :action => "new"
    end
  end

  def new
    @job = Job.new
  end

  def destroy
    
  end

  def update
    
  end

  def add_status
    
  end


end
