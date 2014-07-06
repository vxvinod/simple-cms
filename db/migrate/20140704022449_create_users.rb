class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.column "first_name", :string, :limit => 25
    	t.string "last_name", :limit => 50
    	t.string "email", :default => "", :null => false
    	t.string "password", :limit => 40
      t.timestamps
    end
    rename_table :users,:admin_users
  end

  def down
  		drop_table :admin_users
  end

end
