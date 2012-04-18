class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :contact_type
      t.string :insurance_company
      t.string :contact_name
      t.text :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.text :phone_no
      t.string :email
      t.timestamps
    end
  end
end
