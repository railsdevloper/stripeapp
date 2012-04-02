class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :plan_id
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :company
      t.text :company_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.integer :phone  
      t.string :cardholder_name
      t.string :card_type
      t.string :last4
      t.string :exp_month
      t.string :exp_year   
      t.timestamps
    end
  end
end
