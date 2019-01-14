class AddFieldsToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :notes, :text
  	# add_column :answers, :file, :file
  end

end
