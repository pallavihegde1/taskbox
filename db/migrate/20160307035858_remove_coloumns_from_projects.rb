class RemoveColoumnsFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects,:allocated_budget
  end
end
