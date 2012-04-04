class CreateInventoriesSituations < ActiveRecord::Migration
  def change
    create_table :inventories_situations do |t|
      t.integer :inventory_id
      t.integer :situation_id
      t.timestamps
    end
  end
end
