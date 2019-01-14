class CreateJobhazardsFiles < ActiveRecord::Migration
  def change
    create_table :jobhazards_files do |t|
      t.integer :jobhazard_id
      t.string :file

      t.timestamps
    end
  end
end
