class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.integer :id
      t.integer :user_id
      t.string :uuid
      t.string :name
      t.string :type
      t.boolean :private, :default => false
      t.binary :body, :limit => 10.megabyte

      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
