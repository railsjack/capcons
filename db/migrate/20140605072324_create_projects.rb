class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string 	:name
    	t.string 	:address
    	t.string 	:contact_info
      t.integer :user_id
    	t.integer :creator_id
      t.timestamps
    end
  end
end
