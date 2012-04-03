class CreateJobsStatuses < ActiveRecord::Migration
  def change
    create_table :jobs_statuses do |t|
      t.integer :job_id
      t.integer :status_id
      t.timestamps
    end    
  end
end
