class PeopleController < ApplicationController
  
  before_filter :find_insurance_company, :only => [:new, :edit]
  before_filter :find_by_type, :only => [:index]

  def index
    @person = @contact_people || current_subscription.people.all 
  end

  def edit
    @person = Person.find(params[:id])
    render :template => "people/new.html.haml"
  end

  def new 
    @person = current_subscription.people.new
  end

  def show
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      redirect_to people_path(current_subscription.username)
    else
     render :action => "new"
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      redirect_to people_path(current_subscription.username)
    else
      render :action => "show"
    end
  end

  private 
  
  def find_insurance_company
    @insurance_companies = current_subscription.insurance_companies || []
  end

  def find_by_type
    return unless params[:type]
    @contact_people = params[:type] == "All" ? current_subscription.people.all : 
    current_subscription.people.find_all_by_contact_type(params[:type])
  end

end
