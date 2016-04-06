class Category < ActiveRecord::Base

	has_many :project_categories
	has_many :project, through: :project_categories
end
