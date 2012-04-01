class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item_name
      t.string :room
      t.string :local_location_1
      t.text :local_location
      t.string :global_location_1
      t.text :global_location
      t.string :condition
      t.text :notes
      t.timestamps
    end
  end
end
