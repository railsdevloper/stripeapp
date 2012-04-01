class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :customer_name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :phone
      t.string :email
      t.string :insurance_company
      t.string :adjuster
      t.integer :claim_number
      t.timestamps
    end
  end
end
