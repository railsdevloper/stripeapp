# rake contentsapp:add_default_username

namespace :contentsapp do
  task :add_default_username => :environment do
    Subscription.all.each_with_index do |user, index|
      user.update_attribute(:username, "user#{index}") unless user.username?
    end
  end
end
