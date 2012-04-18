class InsuranceCompaniesController < ApplicationController
  

  def index
  end

  def new
    @insurance_company = InsuranceCompany.new
    render :layout => false
  end

  def create
    @insurance_company = InsuranceCompany.new(params[:insurance_company])
    respond_to do |format|  
      if @insurance_company.save
        format.js 
      else
        render :action => :new, :layout => false
      end
    end
  end


end