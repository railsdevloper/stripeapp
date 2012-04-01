class AddJobIdToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :job_id, :integer
  end
end
