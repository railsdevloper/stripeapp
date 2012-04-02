class ModifySubscriptionsToAddNewColumns < ActiveRecord::Migration
  def change
    add_column :subscriptions, :first_name, :string
    add_column :subscriptions, :last_name, :string
    add_column :subscriptions, :position, :string
    add_column :subscriptions, :company, :string
    add_column :subscriptions, :company_addr, :text
    add_column :subscriptions, :city, :string
    add_column :subscriptions, :state, :string
    add_column :subscriptions, :zip_code, :integer
    add_column :subscriptions, :country, :string
    add_column :subscriptions, :phone_no, :bigint
    add_column :subscriptions, :cardholder_name, :string
    add_column :subscriptions, :last_four_digit, :integer
    add_column :subscriptions, :expiration_month, :integer
    add_column :subscriptions, :expiration_year, :integer
    add_column :subscriptions, :card_type, :string
#    add_column :subscriptions, "encrypted_password", :string, :limit => 128, :default => ""
  end
end
