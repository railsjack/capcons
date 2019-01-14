class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :api
      t.integer :user_id

      t.timestamps
    end
  end
end
