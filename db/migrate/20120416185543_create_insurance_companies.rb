class CreateInsuranceCompanies < ActiveRecord::Migration
  def change
    create_table :insurance_companies do |t|
      t.string :name
      t.integer :subscription_id
      t.timestamps
    end
  end
end
