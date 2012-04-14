class RenameWebsiteToUserName < ActiveRecord::Migration
  def up
    rename_column :subscriptions, :website, :username
  end

  def down
    rename_column :subscriptions, :username, :website
  end
end
