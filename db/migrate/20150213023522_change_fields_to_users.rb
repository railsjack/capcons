class ChangeFieldsToUsers < ActiveRecord::Migration
  def change
		change_column_null :users, :allow_web_access, false
		change_column_default	:users, :allow_web_access, true
  end
end
