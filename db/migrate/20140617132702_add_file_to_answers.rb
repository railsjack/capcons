class AddFileToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :file, :string
  end
end
