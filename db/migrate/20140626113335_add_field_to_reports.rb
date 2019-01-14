class AddFieldToReports < ActiveRecord::Migration
  def change
  	add_column :reports,:submit,:date, :null => true
  end
end
