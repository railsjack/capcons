class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :report_type
      t.string :your_name
      t.string :job_title
      t.date :injury_date
      t.time :injury_time
      t.string :witnesses
      t.string :location
      t.string :circumstances
      t.string :event_discription
      t.string :injuries_type
      t.boolean :ppe_used
      t.boolean :medical_assistance_provided
      t.integer :project_id
      t.integer :downloaded
      t.timestamps
    end
  end
end
