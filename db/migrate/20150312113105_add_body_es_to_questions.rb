class AddBodyEsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :body_es, :text, after: :body
  end
end
