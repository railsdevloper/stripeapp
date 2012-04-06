class JobsController < ApplicationController

#  layout "form"

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
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
    JobsStatus.create(:job_id => params[:job_id], :status_id => params[:status])
    @job = Job.find(params[:job_id])
    render :action => "show", :locals => {:job => @job}  
  end


end
