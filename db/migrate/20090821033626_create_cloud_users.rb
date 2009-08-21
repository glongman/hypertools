class CreateCloudUsers < ActiveRecord::Migration
  def self.up
    create_table :cloud_users do |t|
      t.integer :id
      t.string :uuid
      t.binary :body
      t.boolean :blocked, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :cloud_users
  end
end
