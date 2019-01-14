class CreateJobhazards < ActiveRecord::Migration
  def change
    create_table :jobhazards do |t|
      t.string :sow
      t.string :criticalsteps
      t.string :situations
      t.string :worsthappen
      t.string :defenses
      t.timestamps
    end
  end
end
