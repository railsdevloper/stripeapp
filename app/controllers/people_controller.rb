class PeopleController < ApplicationController
  
  before_filter :find_insurance_company, :only => [:new, :edit]

  def index
    @person = current_subscription.people.all
    
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


end
