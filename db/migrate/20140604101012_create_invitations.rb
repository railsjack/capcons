class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|

    	t.string 	:email
    	t.string 	:name
    	t.string 	:role
      t.integer :user_id
    	t.string  :auth_token	

      t.timestamps
    end
  end
end
