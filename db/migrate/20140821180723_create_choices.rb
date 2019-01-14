class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :checklist_id
      t.integer :category_id

      t.timestamps
    end
  end
end
