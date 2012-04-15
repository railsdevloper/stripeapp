# == Schema Information
#
# Table name: jobs_statuses
#
#  id         :integer         not null, primary key
#  job_id     :integer
#  status_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class JobsStatus < ActiveRecord::Base
  belongs_to :job
  belongs_to :status
end
