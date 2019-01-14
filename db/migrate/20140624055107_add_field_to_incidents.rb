class AddFieldToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :file, :string
  end
end
