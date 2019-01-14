class AddFieldToJobhazards < ActiveRecord::Migration
  def change
    add_column :jobhazards, :file, :string
    add_column :jobhazards, :project_id, :integer
    add_column :jobhazards, :downloaded, :integer
  end
end
