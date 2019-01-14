class ChangeFieldsToIncidents < ActiveRecord::Migration
  def change
  	remove_column :incidents,:ppe_used
  	remove_column :incidents,:medical_assistance_provided
  	add_column :incidents, :ppe_used, :string
  	add_column :incidents,:medical_assistance_provided, :string
  end
end
