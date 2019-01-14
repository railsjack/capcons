class CreateIncidentsFiles < ActiveRecord::Migration
  def change
    create_table :incidents_files do |t|
      t.integer :incident_id
      t.string :file

      t.timestamps
    end
  end
end
