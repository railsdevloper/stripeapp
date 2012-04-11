class AddSubscriptionIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :subscription_id, :integer
  end
end
