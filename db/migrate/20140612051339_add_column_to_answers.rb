class AddColumnToAnswers < ActiveRecord::Migration
  def change
  	remove_column :answers,:project_id
  	add_column :answers,:report_id, :integer
  end
end
