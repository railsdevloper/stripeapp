# rake contentsapp:create_inv_statuses

namespace :contentsapp do
  task :create_inv_statuses => :environment do
    Situation.create(:name => "Packout")
    Situation.create(:name => "Inspection")
    Situation.create(:name => "Processing")
    Situation.create(:name => "Packback")
    Situation.create(:name => "Returned")
    Situation.create(:name => "Disposed")
  end
end
