class AddSubscriptionIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :subscription_id, :integer
  end
end
