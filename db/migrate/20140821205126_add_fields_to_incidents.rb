class AddFieldsToIncidents < ActiveRecord::Migration
  def change
  	add_column :incidents, :cn, :boolean, :default=> false
  end
end
