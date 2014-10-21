class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :session_token
    end

	  add_index :users, :username
	end
end
