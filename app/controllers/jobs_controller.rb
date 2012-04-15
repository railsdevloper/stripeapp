class JobsController < ApplicationController
  
  before_filter :can_add_jobs?, :only => [:new, :create]
  
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

  def add_status
    @job = Job.find_by_customer_name(params[:customer_name])
    JobsStatus.create(:job_id => @job.try(:id), :status_id => params[:status])
    render :action => "show", :locals => {:job => @job}  
  end

  private

  def can_add_jobs?
    unless can_add_job?(current_subscription)      
      flash[:error] = "Sorry, you have reached the maximum jobs allowed this month for the <a>#{@current_plan}</a> plan. Please upgrade to add new job <a href='#'>Upgrade</a>".html_safe
      redirect_to jobs_path(current_subscription.username) and return
    end      
  end 

end
