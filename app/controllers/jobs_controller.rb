class JobsController < ApplicationController
  respond_to :html

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.create(params[:job])
    if @job.save
      redirect_to "/#{current_subscription.username}/jobs/#{@job.customer_name}/inventory" 
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
    @job = Job.find_by_customer_name(params[:customer_name])
    JobsStatus.create(:job_id => @job.try(:id), :status_id => params[:status])
    render :action => "show", :locals => {:job => @job}  
  end


end
