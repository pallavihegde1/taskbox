class AddColumnToProject < ActiveRecord::Migration
  def change
  	add_column:clients,:fax_no,:integer
  end
end
