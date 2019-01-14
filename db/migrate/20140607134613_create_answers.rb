class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :project_id
      t.integer :question_id
      t.integer :status, default: GlobalConstants::Answers::DEFAULT_STATUS
      t.timestamps
    end
  end
end
