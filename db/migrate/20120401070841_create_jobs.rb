class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :job_detail
      t.timestamps
    end
  end
end
