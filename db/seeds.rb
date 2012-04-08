
unless Plan.all.size > 0
  #create new plans with new prices
  Plan.create!(:name => "Basic", :price => 149)
  Plan.create!(:name => "Plus", :price => 199)
  Plan.create!(:name => "Pro", :price => 249)
else
  #update the Plans
  plan_hash0 = {}
  plan_hash0[:name] = "Basic"
  plan_hash0[:price] = 149

  plan_hash1 = {}
  plan_hash1[:name] = "Plus"
  plan_hash1[:price] = 199

  plan_hash2 = {}
  plan_hash2[:name] = "Pro"
  plan_hash2[:price] = 249

  plan_hash = [plan_hash0, plan_hash1, plan_hash2]

  Plan.all.each_with_index do |plan,index|
    plan.update_attributes(plan_hash[index])
    puts plan.inspect
  end    

end
