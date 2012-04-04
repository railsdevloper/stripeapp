class Situation < ActiveRecord::Base
  has_and_belongs_to_many :inventries
end
