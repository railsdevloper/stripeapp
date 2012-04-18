module PeopleHelper
  
  def find_insurance_comp_options(obj)
    if obj
      obj.all.collect {|p| [ p.name, p.id ] }
    else
      []
    end
  end


end
