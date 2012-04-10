class ModifyPhoneNoColumnOfSubscriptions < ActiveRecord::Migration
  def up
    change_column :subscriptions, :phone_no, :text
  end

  def down
    change_column :subscriptions, :phone_no, :bigint
  end
end
