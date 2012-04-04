# rake contentsapp:create_statuses

namespace :contentsapp do
  task :create_statuses => :environment do
    Status.create(:name => "Active")
    Status.create(:name => "In Active")
    Status.create(:name => "On Hold")
    Status.create(:name => "Complete")
  end
end
