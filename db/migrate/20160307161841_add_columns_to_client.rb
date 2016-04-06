class AddColumnsToClient < ActiveRecord::Migration
  def change
  	add_column:clients,:age,:integer
  end
end
