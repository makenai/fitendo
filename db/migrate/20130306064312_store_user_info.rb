class StoreUserInfo < ActiveRecord::Migration
  def up
    drop_table :users
    create_table :users do |t|
      t.string :user_id
      t.string :display_name
      t.string :access_token
      t.string :access_secret
      t.datetime :last_access
      t.timestamps
    end
    add_index :users, :user_id, :unique => true
  end
end
