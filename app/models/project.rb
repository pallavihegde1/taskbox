class Project < ActiveRecord::Base
	belongs_to :client
	has_many:tasks
	belongs_to:user

	has_many :project_categories
	has_many :categories, through: :project_categories

	#arguments will have a colon before
	#method options will have a colon after
	#option values will have colon before
     validates_presence_of :name,:status
end
