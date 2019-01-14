class CreateAnswersFiles < ActiveRecord::Migration
  def change
    create_table :answers_files do |t|
      t.integer :answer_id
      t.string :file

      t.timestamps
    end
  end
end
