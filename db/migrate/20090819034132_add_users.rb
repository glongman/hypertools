class AddUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :login
      t.string    :email
      t.string    :crypted_password
      t.string    :salt
      t.string    :name
      t.string    :remember_token, :limit => 40
      t.datetime  :remember_token_expires_at
      t.timestamps
    end

    add_index :users, [:login]
  end

  def self.down
     drop_table :users
  end
end
