class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :allow_web_access, :boolean
  end
end
