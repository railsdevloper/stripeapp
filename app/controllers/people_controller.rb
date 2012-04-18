class PeopleController < ApplicationController
  def index
    @person = current_subscription.people.all
    
  end

  def new 
    @person = current_subscription.people.new
    @insurance_companies = current_subscription.insurance_companies || []
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      redirect_to people_path(current_subscription.username)
    else
     render :action => "new"
    end
  end

end
