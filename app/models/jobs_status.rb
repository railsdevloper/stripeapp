class JobsStatus < ActiveRecord::Base
  belongs_to :job
  belongs_to :status
end
