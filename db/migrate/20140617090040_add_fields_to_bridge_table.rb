class AddFieldsToBridgeTable < ActiveRecord::Migration
  def change
  	add_column :projects_users, :user_id, :integer
  	add_column :projects_users, :project_id, :integer
  end
end
