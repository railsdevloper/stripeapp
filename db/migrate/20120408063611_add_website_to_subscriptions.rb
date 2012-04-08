class AddWebsiteToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :website, :string
  end
end
